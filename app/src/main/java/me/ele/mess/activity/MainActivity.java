package me.ele.mess.activity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.RecyclerView;
import me.ele.mess.CustomView;
import me.ele.mess.MyAdapter;
import me.ele.mess.R;

public class MainActivity extends AppCompatActivity {

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);
    RecyclerView rv = findViewById(R.id.rv);
    CustomView customView = (CustomView) findViewById(R.id.custom_view);
    customView.setOnClickListener(new View.OnClickListener() {
      @Override
      public void onClick(View v) {
        Toast.makeText(MainActivity.this, "haha", Toast.LENGTH_SHORT).show();
      }
    });

    rv.setAdapter(new MyAdapter());
  }

}
