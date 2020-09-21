#include "stm32f4xx.h"
#define start_timer()    *((volatile uint32_t*)0xE0001000) = 0x40000001  // Enable CYCCNT register
#define stop_timer()   *((volatile uint32_t*)0xE0001000) = 0x40000000  // Disable CYCCNT register
#define get_timer()   *((volatile uint32_t*)0xE0001004)               // Get value from CYCCNT register


unsigned int in[4] = {0x06,0x0F,0x06,0x0B};
unsigned int out[4];
unsigned int RoundKey[3];
unsigned int key[4] = {0x0A,0x07,0x03,0x0B};
unsigned int RCon[2] = {0x80,0x30};

//function of subNibbles
unsigned int getSBoxValue(unsigned int num)
{
	unsigned int sbox[16] =
	{
		0x09, 0x04, 0x0a, 0x0b,
		0x0d, 0x01, 0x08, 0x05,
		0x06, 0x02, 0x00, 0x03,
		0x0c, 0x0e, 0x0f, 0x07
	};
	return sbox[num];
}

//function of RotWords
unsigned char RotWords (unsigned char rotating)
{
	unsigned char y= (rotating<<4) | (rotating>>4);
	return y;
}

//function of MixColumns
unsigned int MixColumns (unsigned int value)
{
		unsigned int ResultofMult[16] =
		{
			0x00,0x04,0x08,0x0c,
			0x03,0x07,0x0b,0x0f,
			0x06,0x02,0x0e,0x0a,
			0x05,0x01,0x0d,0x09
		};
		return ResultofMult[value];
}

//function of KeyExpansion
unsigned int KeyExpansion (int i)
{
	unsigned int w0 = (key[0]<<4) | (key[1]);
	unsigned int w1 = (key[2]<<4) | (key[3]);
	unsigned int w2 = w0 ^ RCon[0] ^ ((getSBoxValue(key[3])<<4) | (getSBoxValue(key[2])));
	unsigned int w3 = w1 ^ w2;

	unsigned int Rotw3 = RotWords(w3);
	unsigned int Rotw3_1 = Rotw3>>4;
	unsigned int Rotw3_2 = w3>>4;

	unsigned int w4 = w2 ^ RCon[1] ^ ((getSBoxValue(Rotw3_1)<<4) | (getSBoxValue(Rotw3_2)));
	unsigned int w5 = w3 ^ w4;

	unsigned int RKey[3];
	RKey[0] = (w0<<8) | (w1);
	RKey[1] = (w2<<8) | (w3);
	RKey[2] = (w4<<8) | (w5);

	return RKey[i];
}



int main()
{
	uint32_t beginningcycles=0;
	uint32_t totalcycles=0;

	start_timer();
	beginningcycles = get_timer();

		//RoundKeys
		unsigned int RoundKey[3] = {KeyExpansion(0),KeyExpansion(1),KeyExpansion(2)};
		unsigned int RKey0[4] = {RoundKey[0]>>12, (RoundKey[0]&0x0f00)>>8, (RoundKey[0]&0x00f0)>>4, RoundKey[0]&0x000f};
		unsigned int RKey1[4] = {RoundKey[1]>>12, (RoundKey[1]&0x0f00)>>8, (RoundKey[1]&0x00f0)>>4, RoundKey[1]&0x000f};
		unsigned int RKey2[4] = {RoundKey[2]>>12, (RoundKey[2]&0x0f00)>>8, (RoundKey[2]&0x00f0)>>4, RoundKey[2]&0x000f};

		//AddRoundKey1
		unsigned int state[4] = {in[0] ^ RKey0[0], in[1] ^ RKey0[1], in[2] ^ RKey0[2], in[3] ^ RKey0[3]};

		//SubNibble1
		state[0] = getSBoxValue(state[0]);
		state[1] = getSBoxValue(state[1]);
		state[2] = getSBoxValue(state[2]);
		state[3] = getSBoxValue(state[3]);

		//ShiftRows1
		unsigned int temp1;
		temp1 = state[1];
		state[1] = state[3];
		state[3] = temp1;

		unsigned int tempstate0 = state[0];
		unsigned int tempstate1 = state[1];
		unsigned int tempstate2 = state[2];
		unsigned int tempstate3 = state[3];

		//MixColumns

		state[0] = tempstate0 ^ (MixColumns(tempstate1));
		state[1] = (MixColumns(tempstate0)) ^ tempstate1;
		state[2] = tempstate2 ^ (MixColumns(tempstate3));
		state[3] = (MixColumns(tempstate2)) ^ tempstate3;

		//AddRoundKey2
		state[0] = state[0] ^ RKey1[0];
		state[1] = state[1] ^ RKey1[1];
		state[2] = state[2] ^ RKey1[2];
		state[3] = state[3] ^ RKey1[3];

		//SubNibble2
		state[0] = getSBoxValue(state[0]);
		state[1] = getSBoxValue(state[1]);
		state[2] = getSBoxValue(state[2]);
		state[3] = getSBoxValue(state[3]);

		//ShiftRows2
		unsigned int temp2;
		temp2 = state[1];
		state[1] = state[3];
		state[3] = temp2;

		//AddRoundKey3
		state[0] = state[0] ^ RKey2[0];
		state[1] = state[1] ^ RKey2[1];
		state[2] = state[2] ^ RKey2[2];
		state[3] = state[3] ^ RKey2[3];

		//Ciphertext
		out[0] = state[0];
		out[1] = state[1];
		out[2] = state[2];
		out[3] = state[3];

	totalcycles = get_timer() - beginningcycles;
	stop_timer();

}
