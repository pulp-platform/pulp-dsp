# 1 "plp_conv_i32s_xpulpv2.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "plp_conv_i32s_xpulpv2.c"
# 54 "plp_conv_i32s_xpulpv2.c"
void plp_conv_i32s_xpulpv2(const int32_t * pSrcA,
			   const uint32_t srcALen,
			   const int32_t * pSrcB,
			   const uint32_t srcBLen,
			   int32_t * pRes){


  const int32_t *pIn1 = pSrcA;
  const int32_t *pIn2 = pSrcB;
  int32_t *pOut = pRes;
  const int32_t *px;
  const int32_t *py;
  const int32_t *pSrc1, *pSrc2;
  int32_t sum;
  uint32_t blockSize1, blockSize2, blockSize3;
  uint32_t j, k, count, blkCnt;


  int32_t acc0, acc1, acc2, acc3;
  int32_t x0, x1, x2, x3, c0;


  int32_t temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8;

  blockSize1 = srcBLen - 1U;
  blockSize2 = srcALen - (srcBLen - 1U);
  blockSize3 = blockSize1;
# 94 "plp_conv_i32s_xpulpv2.c"
  count = 1U;


  px = pIn1;


  py = pIn2;






  while (blockSize1 > 0U)
    {

      sum = 0;

      temp1=*px;
      temp2=*py;



      k = count >> 1U;
      while (k > 0U)
	{
	  temp3=*(px+1);
	  temp4=*(py-1);

	  sum += temp1*temp2;



	  sum += temp3*temp4;

	  temp1=*(px+2);
	  temp2=*(py-2);

	  px+=2;
	  py-=2;


	  k--;
	}


      k = count % 0x2U;

      if(k){
	sum += temp1*temp2;
      }
# 161 "plp_conv_i32s_xpulpv2.c"
      *pOut++ = sum;


      py = pIn2 + count;
      px = pIn1;


      count++;


      blockSize1--;
    }
# 185 "plp_conv_i32s_xpulpv2.c"
  px = pIn1;


  pSrc2 = pIn2 + (srcBLen - 1U);
  py = pSrc2;


  count = 0U;
# 201 "plp_conv_i32s_xpulpv2.c"
  if (srcBLen >= 4U)
    {




      blkCnt = blockSize2 >> 2U;

      while (blkCnt > 0U)
	{

	  acc0 = 0;
	  acc1 = 0;
	  acc2 = 0;
	  acc3 = 0;


	  k = srcBLen >> 2U;

	  x0 = *px++;
	  x1 = *px++;
	  x2 = *px++;



	  do
	    {

	      c0 = *py--;

	      x3 = *(px);



	      acc0 += x0 * c0;

	      acc1 += x1 * c0;

	      acc2 += x2 * c0;

	      acc3 += x3 * c0;


	      c0 = *py--;

	      x0 = *(px + 1U);



	      acc0 += x1 * c0;

	      acc1 += x2 * c0;

	      acc2 += x3 * c0;

	      acc3 += x0 * c0;


	      c0 = *py--;

	      x1 = *(px + 2U);



	      acc0 += x2 * c0;

	      acc1 += x3 * c0;

	      acc2 += x0 * c0;

	      acc3 += x1 * c0;


	      c0 = *py--;


	      x2 = *(px + 3U);
	      px += 4U;



	      acc0 += x3 * c0;

	      acc1 += x0 * c0;

	      acc2 += x1 * c0;

	      acc3 += x2 * c0;

	    } while (--k);



	  k = srcBLen % 0x4U;

	  while (k > 0U)
	    {

	      c0 = *py--;

	      x3 = *px++;



	      acc0 += x0 * c0;

	      acc1 += x1 * c0;

	      acc2 += x2 * c0;

	      acc3 += x3 * c0;


	      x0 = x1;
	      x1 = x2;
	      x2 = x3;


	      k--;
	    }


	  *pOut++ = acc0;
	  *pOut++ = acc1;
	  *pOut++ = acc2;
	  *pOut++ = acc3;


	  count += 4U;


	  px = pIn1 + count;
	  py = pSrc2;


	  blkCnt--;
	}



      blkCnt = blockSize2 % 0x4U;
# 350 "plp_conv_i32s_xpulpv2.c"
      while (blkCnt > 0U)
	{

	  sum = 0;

	  temp1 = *px;
	  temp2 = *py;



	  k = srcBLen >> 1U;
	  while (k > 0U)
	    {
	      temp3 = *(px+1);
	      temp4 = *(py-1);

	      sum = __MAC(sum, temp1, temp2);
	      sum = __MAC(sum, temp3, temp4);

	      temp1 = *(px+2);
	      temp2 = *(py-2);

	      px+=2;
	      py-=2;


	      k--;
	    }


	  k = srcBLen % 0x2U;

	  if(k){
	    sum += temp1*temp2;
	  }
# 403 "plp_conv_i32s_xpulpv2.c"
	  *pOut++ = sum;


	  count++;


	  px = pIn1 + count;
	  py = pSrc2;


	  blkCnt--;
	}
    }
  else
    {


      blkCnt = blockSize2;

      while (blkCnt > 0U)
	{
	  sum = 0;

	  temp1 = *px;
	  temp2 = *py;




	  k = srcBLen >> 1U;
	  while (k > 0U)
	    {
	      temp3 = *(px+1);
	      temp4 = *(py-1);

	      sum = __MAC(sum, temp1, temp2);
	      sum = __MAC(sum, temp3, temp4);

	      temp1 = *(px+2);
	      temp2 = *(py-2);

	      px+=2;
	      py-=2;


	      k--;
	    }


	  k = srcBLen % 0x2U;

	  if(k){
	    sum += temp1*temp2;
	  }
# 474 "plp_conv_i32s_xpulpv2.c"
	  *pOut++ = sum;


	  count++;


	  px = pIn1 + count;
	  py = pSrc2;


	  blkCnt--;
	}
    }
# 504 "plp_conv_i32s_xpulpv2.c"
  pSrc1 = pIn1 + (srcALen - (srcBLen - 1U));
  px = pSrc1;


  pSrc2 = pIn2 + (srcBLen - 1U);
  py = pSrc2;




  while (blockSize3 > 0U)
    {

      sum = 0;



      k = blockSize3 >> 1U;

      temp1 = *px;
      temp2 = *py;

      while (k > 0U)
	{
	  temp3 = *(px+1);
	  temp4 = *(py-1);

	  sum = __MAC(sum, temp1, temp2);
	  sum = __MAC(sum, temp3, temp4);

	  temp1 = *(px+2);
	  temp2 = *(py-2);

	  px+=2;
	  py-=2;


	  k--;
	}


      k = blockSize3 % 0x2U;

      if(k){
	sum += temp1*temp2;
      }
# 570 "plp_conv_i32s_xpulpv2.c"
      *pOut++ = sum;

      px = ++pSrc1;
      py = pSrc2;

      blockSize3--;
    }
}
