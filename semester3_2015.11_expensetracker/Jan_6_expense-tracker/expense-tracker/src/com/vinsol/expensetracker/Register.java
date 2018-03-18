package com.vinsol.expensetracker;

import com.tandong.swichlayout.SwitchLayout;
import com.vinsol.expensetracker.Sign.helper;

import android.app.Activity;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteDatabase.CursorFactory;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class Register extends Activity implements OnClickListener {
	Button sign;
	Button cancel;
	static final String dbname="Account";
	static final int dbversion=1;
	static final String tablename="Account";
	static Context context;
	SQLiteDatabase sqldb;
	EditText account;
	EditText password;
	EditText repeatpassword;
	@Override
	
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.sign_register);
		sign= (Button)findViewById(R.id.edit_sign);
		sign.setOnClickListener(this);
		
		account=(EditText)findViewById(R.id.reg_account);
	     password=(EditText)findViewById(R.id.reg_password);
	      repeatpassword=(EditText)findViewById(R.id.reg_rep_password);
		 
		
	}
	
	
	public void onClick(View v) {
		switch(v.getId()){
	       case R.id.reg_sign:
//	    	   Toast  toast=Toast.makeText(getApplicationContext(), "Success test", Toast.LENGTH_SHORT);
//	    	   toast.show();
	    	   if((repeatpassword.getText().toString())==(password.getText().toString())){
	    		   context=this;
	   		       helper help=new helper(context, dbname, null, dbversion);
	   		
	   		       sqldb=help.getWritableDatabase();
	   	           ContentValues cv=new ContentValues();
	   	            cv.put("account",account.getText().toString());
	   	              cv.put("password",password.getText().toString());
	   	           sqldb.insertOrThrow(tablename, null, cv);
	   	           Toast.makeText(context, "Account created.",Toast.LENGTH_LONG).show();
	   	           }
	    	   else {
	    		   Toast wrongword=Toast.makeText(getApplicationContext() ,"The password you put is not consistent,check it again!", Toast.LENGTH_LONG);
	    		   wrongword.show();
			}
	         break;
	       case R.id.reg_cancel:
	    	   Intent back=new Intent(Register.this,Sign.class);
	    	    startActivity(back);
	    	   finish();
	    	   
	    	   
	         break;  
	       default:
	        break;
	      }
	  }
	

		
	
	
	
	
	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
	switch (keyCode) {
	case KeyEvent.KEYCODE_BACK:
		SwitchLayout.getSlideToRight(this, false, null);
		
		break;

	default:
		break;
	}
		return super.onKeyDown(keyCode, event);
	}

	
	class helper extends SQLiteOpenHelper{

		public helper(Context context, String name, CursorFactory factory,
				int version) {
			super(context, name, factory, version);
			// TODO Auto-generated constructor stub
		}

		@Override
		public void onCreate(SQLiteDatabase db) {
			// TODO Auto-generated method stub
			db.execSQL("CREATE TABLE Account (account TEXT,password TEXT)");
			
		}

		@Override
		public void onUpgrade(SQLiteDatabase db, int arg1, int arg2) {
			// TODO Auto-generated method stub
//			db.execSQL("DROP TABLE IF EXISTS Account");
			onCreate(db);

			
		}
		

		
	}
	

}
