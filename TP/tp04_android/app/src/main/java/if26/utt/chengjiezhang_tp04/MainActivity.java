package if26.utt.chengjiezhang_tp04;

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Button b1 = findViewById(R.id.button);
        Button b2 = findViewById(R.id.button2);
        b1.setOnClickListener(this);
        b2.setOnClickListener(this);
    }

    View.OnLongClickListener lck = new View.OnLongClickListener() {
        @Override
        public boolean onLongClick(View v) {
            return false;
        }
    };
    public void onClick(View v){
        this.switchSelection((Button) findViewById(v.getId()));
    }

    public void switchSelection(Button b){
        b.setSelected(!b.isSelected());
        if (b.isSelected()){
            b.setBackgroundColor(Color.RED);
        } else {
            b.setBackgroundColor(Color.GREEN);
        }
    }
}
