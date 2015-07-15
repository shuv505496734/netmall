package com.ibm.models;

public class CartModel 
{
	private String cartid;
	private String itemid;
	private String itemname;
	private int itemprice;
	private int itemqty;
	
	public String getCartid() 
	{
		return cartid;
	}
	
	public void setCartid(String cartid) 
	{
		this.cartid = cartid;
	}
	
	public String getItemid() 
	{
		return itemid;
	}
	
	public void setItemid(String itemid) 
	{
		this.itemid = itemid;
	}
	
	public String getItemname() 
	{
		return itemname;
	}
	
	public void setItemname(String itemname) 
	{
		this.itemname = itemname;
	}
	
	public int getItemprice() 
	{
		return itemprice;
	}
	
	public void setItemprice(int itemprice) 
	{
		this.itemprice = itemprice;
	}
	
	public int getItemqty() 
	{
		return itemqty;
	}
	
	public void setItemqty(int itemqty) 
	{
		this.itemqty = itemqty;
	}
	
}
