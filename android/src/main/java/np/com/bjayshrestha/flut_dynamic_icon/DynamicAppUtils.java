package main.java.np.com.bjayshrestha.flut_dynamic_icon;

import android.content.Context;
import android.content.Intent;
import android.content.ComponentName;
import android.content.pm.PackageManager;
import android.os.Parcelable;
import java.util.ArrayList;

public class DynamicAppUtils {
    public static void changeAppIconDynamically(Context context, String bundleId, String defaultIcon, String iconName,
            ArrayList<String> iconNames) {
        PackageManager pm = context.getApplicationContext().getPackageManager();
        System.out.println("*****CHANGING APP ICON********");
        if (iconName.equals(defaultIcon)) {
            System.out.println("Given icon is default, Enabling MainActivity: " + iconName);
            enableComponent(context, bundleId + ".MainActivity");
            for (String name : iconNames) {
                if (name.equals(iconName))
                    continue;
                System.out.println("Disabling alis activity " + name);
                disableComponent(context, bundleId + ".MainActivityAlias" + name);
            }
        } else {
            System.out.println("Given icon is not default : " + iconName);
            iconNames.remove(iconName);
            for (String name : iconNames) {
                if (name.equals(defaultIcon)) {
                    System.out.println(name + "==" + defaultIcon);
                    System.out.println("Disabling main activity: " + name);
                    disableComponent(context, bundleId + ".MainActivity");
                    continue;
                }
                System.out.println(name + "==" + defaultIcon);
                System.out.println("Disabling alis activity " + name);
                disableComponent(context, bundleId + ".MainActivityAlias" + name);
            }
            System.out.println("Enabling alis activity " + iconName);
            enableComponent(context, bundleId + ".MainActivityAlias" + iconName);
        }
    }

    /**
     * Helper method to enable a component.
     *
     * @param context       The application context
     * @param componentName The component name to enable
     */
    public static void enableComponent(Context context, String componentName) {
        try {
            PackageManager pm = context.getPackageManager();
            pm.setComponentEnabledSetting(
                    new ComponentName(context, componentName),
                    PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
                    PackageManager.DONT_KILL_APP);
        } catch (Exception e) {
            System.out.println("Cannot Enable Component" + componentName);
        }
    }

    /**
     * Helper method to disable a component.
     *
     * @param context       The application context
     * @param componentName The component name to disable
     */
    private static void disableComponent(Context context, String componentName) {
        try {
            PackageManager pm = context.getPackageManager();
            pm.setComponentEnabledSetting(
                    new ComponentName(context, componentName),
                    PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                    PackageManager.DONT_KILL_APP);
        } catch (Exception e) {
            System.out.println("Cannot Disable Component " + componentName);
        }
    }
}
