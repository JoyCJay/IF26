package com.example.accueil;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.SubMenu;
import android.widget.TextView;

public class Soiree extends AppCompatActivity {
    private Toolbar mToolbar;
    private TextView mtvTitle;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_soiree);
        Toolbar mToolbar = (Toolbar) findViewById(R.id.toolbar);
        mToolbar.setTitle("");
        setSupportActionBar(mToolbar);
        mtvTitle = (TextView) findViewById(R.id.toolbar_title);
        mtvTitle.setText("Soirée");
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.main_menu, menu);
        menu.add(0,Menu.FIRST +1,1,"Accueil");
        menu.add(0,Menu.FIRST +2,2,"Contatcts");
        menu.add(0,Menu.FIRST +3,3,"Etude");
        SubMenu Evenement=menu.addSubMenu(0,Menu.FIRST +4,4,"Evenement");
        Evenement.add(0,Menu.FIRST+7,5,"Alerte stage");
        Evenement.add(0,Menu.FIRST+8,6,"Soirée");
        Evenement.add(0,Menu.FIRST+9,7,"Créer une alerte");
        menu.add(Menu.NONE,Menu.FIRST +5,8,"Notification");
        menu.add(Menu.NONE,Menu.FIRST +6,9,"Déconnecter");
        return true;
    }

    public boolean onOptionsItemSelected(MenuItem item) {
        super.onOptionsItemSelected(item);
        switch (item.getItemId()) {
            case Menu.FIRST +1:
                Intent i1 = new Intent(Soiree.this, MainActivity.class);
                startActivity(i1);
                break;
            case Menu.FIRST +2:
                break;
            case Menu.FIRST +3:
                break;
            case Menu.FIRST +4:
                break;
            case Menu.FIRST +5:
                Intent i5 = new Intent(Soiree.this, Notification.class);
                startActivity(i5);
                break;
            case Menu.FIRST +6:
                break;
            case Menu.FIRST +7:
                Intent i2 = new Intent(Soiree.this, Alerte_stage.class);
                startActivity(i2);
                break;
            case Menu.FIRST +8:
                Intent i3 = new Intent(Soiree.this, Soiree.class);
                startActivity(i3);
                break;
            case Menu.FIRST +9:
                Intent i4 = new Intent(Soiree.this, Creer_alerte.class);
                startActivity(i4);
                break;
            case Menu.FIRST +10:
                break;
        }
        return true;

    }
}
