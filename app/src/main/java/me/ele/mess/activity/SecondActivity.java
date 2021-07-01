package me.ele.mess.activity;

import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Toast;

import androidx.annotation.Keep;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import me.ele.mess.KeepMethod;
import me.ele.mess.R;

public class SecondActivity extends AppCompatActivity {

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        return super.onKeyDown(keyCode, event);
    }

    @KeepMethod
    public void onClick(View v){
        if (v.getId() == R.id.textview){
            Toast.makeText(this, "aaa", Toast.LENGTH_SHORT).show();
        }
    }
}
