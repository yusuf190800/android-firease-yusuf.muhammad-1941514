package project;

import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;

public class LoginActivity extends AppCompatActivity {

    private FirebaseAuth mAuth;

    private EditText etUsername, etPassword;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        mAuth = FirebaseAuth.getInstance();

        etUsername = findViewById(R.id.et_username);
        etPassword = findViewById(R.id.et_password);

        Button btnRegister = findViewById(R.id.btn_register);
        btnRegister.setOnClickListener(new View.OnClickListener() {
            @Override
@@ -31,6 +43,49 @@ public void onClick(View v) {
            }
        });

        FloatingActionButton fabLogin = findViewById(R.id.fab_login);
        fabLogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                String username = etUsername.getText().toString();
                String password = etPassword.getText().toString();

                if (username.equals("")){
                    Toast.makeText(LoginActivity.this, "Silahkan input username", Toast.LENGTH_SHORT).show();

                } else if (password.equals("")){
                    Toast.makeText(LoginActivity.this, "Silahkan input password", Toast.LENGTH_SHORT).show();

                } else {

                    mAuth.signInWithEmailAndPassword(username, password)
                            .addOnCompleteListener(LoginActivity.this, new OnCompleteListener<AuthResult>() {
                                @Override
                                public void onComplete(@NonNull Task<AuthResult> task) {
                                    if (task.isSuccessful()) {
                                        // Sign in success, update UI with the signed-in user's information\
                                        FirebaseUser user = mAuth.getCurrentUser();

                                        Toast.makeText(LoginActivity.this, "Authentication success.",
                                                Toast.LENGTH_SHORT).show();


                                    } else {
                                        // If sign in fails, display a message to the user.
                                        Toast.makeText(LoginActivity.this, "Authentication failed.",
                                                Toast.LENGTH_SHORT).show();
                                    }

                                    // ...
                                }
                            });

                }

            }
        });


    }

  2  app/src/main/res/layout/activity_login.xml 
<?xml version="1.0" encoding="utf-8"?>
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:background="#E8E9E8"
    tools:context=".LoginActivity">
    <RelativeLayout
        android:id="@+id/rl_input"
        android:layout_marginRight="70dp"
        android:background="@drawable/sp_rectangle_root"
        android:layout_centerVertical="true"
        android:layout_width="match_parent"
        android:layout_height="wrap_content">
        <EditText
            android:paddingLeft="20dp"
            android:drawableLeft="@drawable/ic_person_outline_black_24dp"
            android:drawablePadding="20dp"
            android:id="@+id/et_username"
            android:hint="Username"
            android:backgroundTint="#FFF"
            android:layout_width="match_parent"
            android:layout_height="60dp" />
        <View
            android:id="@+id/v_saparator"
            android:background="#E8E9E8"
            android:layout_below="@id/et_username"
            android:layout_width="match_parent"
            android:layout_height="0.5dp"/>

        <EditText
            android:id="@+id/et_password"
            android:paddingLeft="20dp"
            android:drawableLeft="@drawable/ic_lock_outline_black_24dp"
            android:drawablePadding="20dp"
            android:backgroundTint="#FFF"
            android:layout_below="@id/v_saparator"
            android:hint="********"
            android:layout_width="match_parent"
            android:layout_height="60dp" />
    </RelativeLayout>

    <android.support.design.widget.FloatingActionButton
        android:id="@+id/fab_login"
        android:layout_marginRight="40dp"
        android:layout_centerVertical="true"
        android:layout_alignParentRight="true"
        android:src="@drawable/ic_arrow_forward_black_24dp"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content" />
    <TextView
        android:layout_centerHorizontal="true"
        android:layout_above="@id/rl_input"
        android:layout_marginBottom="40dp"
        android:textSize="30sp"
        android:textStyle="bold"
        android:text="Login"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content" />
    <TextView
        android:id="@+id/tv_forget"
        android:layout_alignParentRight="true"
        android:layout_below="@id/rl_input"
        android:layout_marginRight="40dp"
        android:layout_marginTop="40dp"
        android:textSize="20sp"
        android:text="Forgot"
        android:textColor="#000"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content" />
    <Button
        android:id="@+id/btn_register"
        android:layout_marginTop="40dp"
        android:layout_below="@id/tv_forget"
        android:text="Register"
        android:background="@drawable/sp_rectangle_root"
        android:textAllCaps="false"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content" />
</RelativeLayout>
