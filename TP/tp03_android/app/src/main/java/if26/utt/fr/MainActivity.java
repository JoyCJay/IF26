package if26.utt.fr;

import androidx.appcompat.app.AppCompatActivity;

import android.content.res.Resources;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final Resources r = this.getResources();
        final TextView tx = (TextView) findViewById (R.id.textView2);
        Button bt = (Button) findViewById(R.id.button);

        bt.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                tx.setBackgroundColor(Color.RED);
                tx.setText(r.getString(R.string.message));
            }
        });
    }
}
