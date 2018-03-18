package com.vinsol.expensetracker;

import android.app.Activity;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteDatabase.CursorFactory;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

import com.google.android.gms.plus.model.people.Person;
import com.tandong.swichlayout.SwitchLayout;






//
public class Sign extends Activity implements OnClickListener{
	Button sign;
	Button cancel;
	static final String dbname="Account";
	static final int dbversion=1;
	static final String tablename="Account";
	static Context context;
	SQLiteDatabase sqldb;
	EditText account;
	EditText password;
	private final String check_acc = "select * from Account";
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		setContentView(R.layout.sign_activity);
		SwitchLayout.getFadingIn(this);
		 sign= (Button)findViewById(R.id.edit_sign);
		 sign.setOnClickListener(this);
//		 Drawable drawable = getResources().getDrawable(R.drawable.cancel_states);   
//		 .setSelector(drawable);
//	
		 account=(EditText)findViewById(R.id.edit_account);
		 password=(EditText)findViewById(R.id.edit_password);

		 
		 ContentValues cv = new ContentValues(); 
	 //indViewById(R.id.btn_go_home).setOnClickListener(this);
		    
		
	}
	
	public void onClick(View v){
	      switch(v.getId()){
	       case R.id.edit_sign:
	    	  String a= account.getText().toString();
	    	  String b= password.getText().toString();
//	    	  String where=
//         	  Cursor cursor=sqldb.query("account",new String[]{"account","password"},"where account = 2",a,null,null,null);
	    	  Cursor c = sqldb.query("Account", new String[]{"account,password"}, "account=? and password=?", new String[]{"a,b"},null,null,null);
	    	  sqldb.execSQL(check_acc);
	    	   
	    	   
//	    	   Toast  toast=Toast.makeText(getApplicationContext(), "Success test", Toast.LENGTH_SHORT);
//	    	   toast.show();
//	    	  context=this;
//	   		  helper help=new helper(context, dbname, null, dbversion);
//	   		
//	   		    sqldb=help.getWritableDatabase();
//	   	        ContentValues cv=new ContentValues();
//	   	        cv.put("account",account.getText().toString());
//	   	        cv.put("password",password.getText().toString());
//	   	        sqldb.insertOrThrow(tablename, null, cv);
//	   	        Toast.makeText(context, "Your account has ",Toast.LENGTH_LONG).show();
	         break;
	       case R.id.edit_cancel:
	    	   Intent backhome=new Intent(Sign.this,Home.class);
	    	    startActivity(backhome);
	    	   finish();
	    	   
	         break;  
	       case R.id.register:
	    	   Intent reg=new Intent(Sign.this,Register.class);
	    	   startActivity(reg);
	    	   
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
			db.execSQL("DROP TABLE IF EXISTS Account");
			onCreate(db);

			
		}
		
	}
}
