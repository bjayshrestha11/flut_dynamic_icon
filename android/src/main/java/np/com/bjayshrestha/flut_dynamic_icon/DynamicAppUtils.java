package main.java.np.com.bjayshrestha.flut_dynamic_icon;

import android.content.Context;
import android.content.Intent;
import android.content.ComponentName;
import android.content.pm.PackageManager;
import android.os.Parcelable;
import java.util.ArrayList;

public class DynamicAppUtils {
    public static void changeAppIconDynamically(Context context, String bundleId, boolean isNewIcon, String iconName,
            ArrayList<String> iconNames) {
        PackageManager pm = context.getApplicationContext().getPackageManager();
        if (isNewIcon) {
            for (String name : iconNames) {
                if (iconName != name) {
                    disableComponent(context, bundleId + ".MainActivityAlias" + name);
                }
            }
            disableComponent(context, bundleId + ".MainActivityAlias");
            enableComponent(context, bundleId + ".MainActivityAlias" + iconName);
        } else {
            enableComponent(context, bundleId + ".MainActivity");
            for (String name : iconNames) {
                disableComponent(context, bundleId + ".MainActivityAlias" + name);
            }
        }
    }

    /**
     * Helper method to enable a component.
     *
     * @param context       The application context
     * @param componentName The component name to enable
     */
    public static void enableComponent(Context context, String componentName) {
        PackageManager pm = context.getPackageManager();
        pm.setComponentEnabledSetting(
                new ComponentName(context, componentName),
                PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
                PackageManager.DONT_KILL_APP);
    }

    /**
     * Helper method to disable a component.
     *
     * @param context       The application context
     * @param componentName The component name to disable
     */
    private static void disableComponent(Context context, String componentName) {
        PackageManager pm = context.getPackageManager();
        pm.setComponentEnabledSetting(
                new ComponentName(context, componentName),
                PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                PackageManager.DONT_KILL_APP);
    }
}
