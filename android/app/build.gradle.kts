plugins {
    id("com.android.application")
    id("kotlin-android")
    id("com.google.gms.google-services")  // Add Google Services plugin
    id("com.google.firebase.crashlytics") // Add Crashlytics plugin
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.dawell.agrovision.agrovision_mobile"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.dawell.agrovision.agrovision_mobile"
        minSdk = 21 // Required for Firebase
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true
    }

    signingConfigs {
        create("release") {
            storeFile = file("agrovision.keystore")
            storePassword = "agrovision123"
            keyAlias = "agrovision"
            keyPassword = "agrovision123"
        }
    }

    buildTypes {
        release {
            // Disable minification for successful build
            isMinifyEnabled = false
            isShrinkResources = false
            // Signing configuration
            signingConfig = signingConfigs.getByName("release")
        }
    }
}

dependencies {
    // Add Firebase BoM
    implementation(platform("com.google.firebase:firebase-bom:32.7.1"))
    
    // Firebase dependencies
    implementation("com.google.firebase:firebase-analytics-ktx")
    implementation("com.google.firebase:firebase-crashlytics-ktx")
    implementation("com.google.firebase:firebase-messaging-ktx")
    
    // MultiDex support
    implementation("androidx.multidex:multidex:2.0.1")
}

flutter {
    source = "../.."
}
