import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// 🚨 Yükleme anahtarı. android/key.properties ve android/upload-keystore.jks
// GİZLİDİR ve YEDEKLENMELİDİR — kaybolursa Play'de bu uygulama bir daha
// güncellenemez. Dosya yoksa (ör. başka bir makinede) derleme çökmez, debug
// anahtarına düşer; ama o APK Play'e yüklenemez.
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(keystorePropertiesFile.inputStream())
}

android {
    namespace = "com.sipling.sipling"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        // flutter_local_notifications eski Android sürümlerinde java.time
        // kullanabilmek için core library desugaring istiyor.
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        // Play'de paket adı bir kez seçilir ve sonsuza dek değişmez.
        applicationId = "com.sipling.app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        //
        // 🚨 Flutter'ın varsayılanı 24'tü; Health Connect (androidx.health.connect)
        // minSdk 26 istiyor, `health` paketi de öyle. 26'ya çıkarmak Android 7.x
        // cihazları uygulamanın dışında bırakır — bilinçli karar (2026-07-09).
        minSdk = 26
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            if (keystorePropertiesFile.exists()) {
                keyAlias = keystoreProperties["keyAlias"] as String
                keyPassword = keystoreProperties["keyPassword"] as String
                storeFile = rootProject.file(keystoreProperties["storeFile"] as String)
                storePassword = keystoreProperties["storePassword"] as String
            }
        }
    }

    buildTypes {
        release {
            signingConfig = if (keystorePropertiesFile.exists()) {
                signingConfigs.getByName("release")
            } else {
                // Anahtar yoksa derleme yine geçsin; bu APK Play'e YÜKLENEMEZ.
                signingConfigs.getByName("debug")
            }
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}
