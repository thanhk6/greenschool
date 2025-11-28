import java.util.Properties
import java.io.FileInputStream
import com.android.build.gradle.api.ApplicationVariant
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

fun getFormattedDateTime(): String {
    val dateFormat = SimpleDateFormat("yyyyMMddHHmm", Locale.getDefault())
    return dateFormat.format(Date())
}

android {
    namespace = "com.thpt.green_school"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    } 

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.thpt.green_school"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            keyAlias = keystoreProperties["keyAlias"] as String
            keyPassword = keystoreProperties["keyPassword"] as String
            storeFile = keystoreProperties["storeFile"]?.let { file(it) }
            storePassword = keystoreProperties["storePassword"] as String
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
        debug {
            signingConfig = signingConfigs.getByName("debug")
            isDebuggable = true
        }
    }
}

// androidComponents {
//     onVariants { variant ->
//         variant.outputs.forEach { output ->
//             val builtType = variant.buildType
//             val versionName = variant.outputs.firstOrNull()?.versionName?.get()

//             output.outputFileName.set("GreenSchool_${flutter.versionName}.${flutter.versionCode}_${getFormattedDateTime()}-${variant.name}.apk")
//         }
//     }
// }

androidComponents {
    onVariants { variant ->
        variant.outputs.forEach { output ->
            if (output is com.android.build.api.variant.impl.VariantOutputImpl) {
                output.outputFileName = "GreenSchool_${flutter.versionName}.${flutter.versionCode}_${getFormattedDateTime()}-${variant.name}.apk"

            val bundleDir = File("$buildDir/outputs/bundle/${variant.name}")
            val originalFile = bundleDir.listFiles()?.find { it.extension == "aab" }

            if (originalFile != null) {
                val newFileName =
                    "GreenSchool_${flutter.versionName}.${flutter.versionCode}_${getFormattedDateTime()}-${variant.name}.aab"
                val newFile = File(bundleDir, newFileName)
                originalFile.renameTo(newFile)
            }
        }
    }
    }
}

dependencies {
    implementation("com.google.android.material:material:1.13.0")
}

flutter {
    source = "../.."
}
