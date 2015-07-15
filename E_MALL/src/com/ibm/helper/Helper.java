package com.ibm.helper;


public class Helper 
{
	public static boolean CheckCaptcha(String captcha,String code)
	{
		boolean status=false;
		
		String newCap[]=captcha.split(" ");
		String str="";
		
		for(int i=0;i<newCap.length;i++)
		{
			str = str+newCap[i];
		}
		
		if(str!=null&&code!=null)
		{
			if(str.equals(code))
			{
				status = true;
				
			}
			else
			{
				status = false;
			}
		}
		
		return status;
	}
}
