package com.example.casper.andmysqlauthentication;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import com.example.casper.andmysqlauthentication.helper.SessionManager;
import com.example.casper.andmysqlauthentication.helper.SQLiteHandler;
import java.util.HashMap;
import android.content.Intent;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class ProfileActivity extends AppCompatActivity {
    private TextView txtName;
    private TextView txtNumber;
    private TextView txtProvince;
    private TextView txtDistrict;
    private TextView txtCreated;
    private TextView txtEmail;
    private Button btnLogout;

    private SQLiteHandler db;
    private SessionManager session;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile);
        txtName = (TextView) findViewById(R.id.name);
        txtNumber = (TextView) findViewById(R.id.number);
        txtProvince = (TextView) findViewById(R.id.province);
        txtDistrict = (TextView) findViewById(R.id.district);
        txtCreated = (TextView) findViewById(R.id.created);
        txtEmail = (TextView) findViewById(R.id.email);
        btnLogout = (Button) findViewById(R.id.btnLogout);

        // SqLite database handler
        db = new SQLiteHandler(getApplicationContext());

        // session manager
        session = new SessionManager(getApplicationContext());

        if (!session.isLoggedIn()) {
            logoutUser();
        }

        // Fetching user details from sqlite
        HashMap<String, String> user = db.getUserDetails();

        String name = user.get("name");
        String number = user.get("number");
        String province = user.get("province");
        String district = user.get("district");
        String created_at = user.get("created_at");
        String email = user.get("email");

        // Displaying the user details on the screen
        txtName.setText(name);
        txtNumber.setText(number);
        txtProvince.setText(province);
        txtDistrict.setText(district);
        txtCreated.setText(created_at);
        txtEmail.setText(email);

        // Logout button click event
        btnLogout.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                logoutUser();
            }
        });
    }

    private void logoutUser() {
        session.setLogin(false);

        db.deleteUsers();

        // Launching the login activity
        Intent intent = new Intent(ProfileActivity.this, LoginActivity.class);
        startActivity(intent);
        finish();
    }
}