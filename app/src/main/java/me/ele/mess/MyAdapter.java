package me.ele.mess;

import android.view.LayoutInflater;
import android.view.ViewGroup;

import androidx.recyclerview.widget.RecyclerView;

public class MyAdapter extends RecyclerView.Adapter<MyVH> {

  @Override public MyVH onCreateViewHolder(ViewGroup parent, int viewType) {
    return new MyVH(
        LayoutInflater.from(parent.getContext()).inflate(R.layout.simple_item, parent, false));
  }

  @Override public void onBindViewHolder(MyVH holder, int position) {

  }

  @Override public int getItemCount() {
    return 100;
  }
}
