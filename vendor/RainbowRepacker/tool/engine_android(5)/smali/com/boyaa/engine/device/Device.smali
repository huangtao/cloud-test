.class public Lcom/boyaa/engine/device/Device;
.super Ljava/lang/Object;
.source "Device.java"


# static fields
.field private static activity:Landroid/app/Activity;

.field private static camera:Lcom/boyaa/engine/device/CameraImpl;

.field private static device:Lcom/boyaa/engine/device/Device;

.field private static gallery:Lcom/boyaa/engine/device/GalleryImpl;

.field private static final sensorListener:Landroid/hardware/SensorEventListener;

.field private static sensorManager:Landroid/hardware/SensorManager;

.field private static stepCounterSensor:Landroid/hardware/Sensor;

.field private static stepNum:I

.field private static telephonyManager:Landroid/telephony/TelephonyManager;

.field private static vibrator:Landroid/os/Vibrator;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 31
    new-instance v0, Lcom/boyaa/engine/device/Device;

    invoke-direct {v0}, Lcom/boyaa/engine/device/Device;-><init>()V

    sput-object v0, Lcom/boyaa/engine/device/Device;->device:Lcom/boyaa/engine/device/Device;

    .line 32
    sput-object v1, Lcom/boyaa/engine/device/Device;->activity:Landroid/app/Activity;

    .line 33
    sput-object v1, Lcom/boyaa/engine/device/Device;->telephonyManager:Landroid/telephony/TelephonyManager;

    .line 34
    sput-object v1, Lcom/boyaa/engine/device/Device;->vibrator:Landroid/os/Vibrator;

    .line 35
    sput-object v1, Lcom/boyaa/engine/device/Device;->camera:Lcom/boyaa/engine/device/CameraImpl;

    .line 36
    sput-object v1, Lcom/boyaa/engine/device/Device;->gallery:Lcom/boyaa/engine/device/GalleryImpl;

    .line 37
    sput-object v1, Lcom/boyaa/engine/device/Device;->sensorManager:Landroid/hardware/SensorManager;

    .line 39
    sput-object v1, Lcom/boyaa/engine/device/Device;->stepCounterSensor:Landroid/hardware/Sensor;

    .line 40
    const/4 v0, 0x0

    sput v0, Lcom/boyaa/engine/device/Device;->stepNum:I

    .line 42
    new-instance v0, Lcom/boyaa/engine/device/Device$1;

    invoke-direct {v0}, Lcom/boyaa/engine/device/Device$1;-><init>()V

    sput-object v0, Lcom/boyaa/engine/device/Device;->sensorListener:Landroid/hardware/SensorEventListener;

    .line 64
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static Beep()V
    .locals 3

    .prologue
    .line 197
    const/4 v2, 0x2

    invoke-static {v2}, Landroid/media/RingtoneManager;->getDefaultUri(I)Landroid/net/Uri;

    move-result-object v0

    .line 198
    .local v0, "notification":Landroid/net/Uri;
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2, v0}, Landroid/media/RingtoneManager;->getRingtone(Landroid/content/Context;Landroid/net/Uri;)Landroid/media/Ringtone;

    move-result-object v1

    .line 199
    .local v1, "ringtone":Landroid/media/Ringtone;
    invoke-virtual {v1}, Landroid/media/Ringtone;->play()V

    .line 200
    return-void
.end method

.method public static Vibrate(I)V
    .locals 3
    .param p0, "ms"    # I

    .prologue
    .line 182
    if-gez p0, :cond_1

    .line 194
    :cond_0
    :goto_0
    return-void

    .line 184
    :cond_1
    sget-object v0, Lcom/boyaa/engine/device/Device;->vibrator:Landroid/os/Vibrator;

    if-nez v0, :cond_2

    .line 185
    sget-object v0, Lcom/boyaa/engine/device/Device;->activity:Landroid/app/Activity;

    const-string v1, "vibrator"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Vibrator;

    sput-object v0, Lcom/boyaa/engine/device/Device;->vibrator:Landroid/os/Vibrator;

    .line 187
    :cond_2
    sget-object v0, Lcom/boyaa/engine/device/Device;->vibrator:Landroid/os/Vibrator;

    invoke-virtual {v0}, Landroid/os/Vibrator;->hasVibrator()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 188
    if-nez p0, :cond_3

    .line 189
    sget-object v0, Lcom/boyaa/engine/device/Device;->vibrator:Landroid/os/Vibrator;

    invoke-virtual {v0}, Landroid/os/Vibrator;->cancel()V

    goto :goto_0

    .line 191
    :cond_3
    sget-object v0, Lcom/boyaa/engine/device/Device;->vibrator:Landroid/os/Vibrator;

    int-to-long v1, p0

    invoke-virtual {v0, v1, v2}, Landroid/os/Vibrator;->vibrate(J)V

    goto :goto_0
.end method

.method static synthetic access$0()I
    .locals 1

    .prologue
    .line 40
    sget v0, Lcom/boyaa/engine/device/Device;->stepNum:I

    return v0
.end method

.method static synthetic access$1(I)V
    .locals 0

    .prologue
    .line 40
    sput p0, Lcom/boyaa/engine/device/Device;->stepNum:I

    return-void
.end method

.method public static enableShakeEvent(ZI)V
    .locals 0
    .param p0, "enable"    # Z
    .param p1, "samplePerSecond"    # I

    .prologue
    .line 262
    if-eqz p0, :cond_0

    .line 263
    invoke-static {p1}, Lcom/boyaa/engine/device/ShakeImpl;->startAccelerometer(I)V

    .line 267
    :goto_0
    return-void

    .line 265
    :cond_0
    invoke-static {}, Lcom/boyaa/engine/device/ShakeImpl;->stopAccelerometer()V

    goto :goto_0
.end method

.method public static enableStepCounterEvent(Z)V
    .locals 5
    .param p0, "enable"    # Z

    .prologue
    const/16 v3, 0x13

    .line 278
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v3, :cond_1

    .line 279
    sget-object v1, Lcom/boyaa/engine/device/Device;->sensorManager:Landroid/hardware/SensorManager;

    if-nez v1, :cond_0

    .line 280
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "sensor"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/SensorManager;

    sput-object v1, Lcom/boyaa/engine/device/Device;->sensorManager:Landroid/hardware/SensorManager;

    .line 283
    :cond_0
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const-string v2, "android.hardware.sensor.stepcounter"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    .line 285
    .local v0, "hasStepCounter":Z
    if-eqz p0, :cond_2

    .line 286
    if-eqz v0, :cond_1

    .line 287
    sget-object v1, Lcom/boyaa/engine/device/Device;->stepCounterSensor:Landroid/hardware/Sensor;

    if-nez v1, :cond_1

    .line 288
    const/4 v1, 0x0

    sput v1, Lcom/boyaa/engine/device/Device;->stepNum:I

    .line 289
    sget-object v1, Lcom/boyaa/engine/device/Device;->sensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v1, v3}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v1

    sput-object v1, Lcom/boyaa/engine/device/Device;->stepCounterSensor:Landroid/hardware/Sensor;

    .line 290
    sget-object v1, Lcom/boyaa/engine/device/Device;->sensorManager:Landroid/hardware/SensorManager;

    sget-object v2, Lcom/boyaa/engine/device/Device;->sensorListener:Landroid/hardware/SensorEventListener;

    sget-object v3, Lcom/boyaa/engine/device/Device;->stepCounterSensor:Landroid/hardware/Sensor;

    const/4 v4, 0x1

    invoke-virtual {v1, v2, v3, v4}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 301
    .end local v0    # "hasStepCounter":Z
    :cond_1
    :goto_0
    return-void

    .line 294
    .restart local v0    # "hasStepCounter":Z
    :cond_2
    sget-object v1, Lcom/boyaa/engine/device/Device;->stepCounterSensor:Landroid/hardware/Sensor;

    if-eqz v1, :cond_1

    .line 295
    sget-object v1, Lcom/boyaa/engine/device/Device;->sensorManager:Landroid/hardware/SensorManager;

    sget-object v2, Lcom/boyaa/engine/device/Device;->sensorListener:Landroid/hardware/SensorEventListener;

    sget-object v3, Lcom/boyaa/engine/device/Device;->stepCounterSensor:Landroid/hardware/Sensor;

    invoke-virtual {v1, v2, v3}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    .line 296
    const/4 v1, 0x0

    sput-object v1, Lcom/boyaa/engine/device/Device;->stepCounterSensor:Landroid/hardware/Sensor;

    goto :goto_0
.end method

.method public static getActivity()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 77
    sget-object v0, Lcom/boyaa/engine/device/Device;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method public static getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 73
    sget-object v0, Lcom/boyaa/engine/device/Device;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method public static declared-synchronized getInches()F
    .locals 9

    .prologue
    .line 173
    const-class v6, Lcom/boyaa/engine/device/Device;

    monitor-enter v6

    :try_start_0
    new-instance v2, Landroid/util/DisplayMetrics;

    invoke-direct {v2}, Landroid/util/DisplayMetrics;-><init>()V

    .line 174
    .local v2, "metrics":Landroid/util/DisplayMetrics;
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v5

    invoke-interface {v5}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 175
    iget v5, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v5, v5

    iget v7, v2, Landroid/util/DisplayMetrics;->ydpi:F

    div-float v4, v5, v7

    .line 176
    .local v4, "yInches":F
    iget v5, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v5, v5

    iget v7, v2, Landroid/util/DisplayMetrics;->xdpi:F

    div-float v3, v5, v7

    .line 177
    .local v3, "xInches":F
    mul-float v5, v3, v3

    mul-float v7, v4, v4

    add-float/2addr v5, v7

    float-to-double v7, v5

    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v0

    .line 178
    .local v0, "diagonalInches":D
    double-to-float v5, v0

    monitor-exit v6

    return v5

    .line 173
    .end local v0    # "diagonalInches":D
    .end local v3    # "xInches":F
    .end local v4    # "yInches":F
    :catchall_0
    move-exception v5

    monitor-exit v6

    throw v5
.end method

.method public static getInstance()Lcom/boyaa/engine/device/Device;
    .locals 1

    .prologue
    .line 68
    sget-object v0, Lcom/boyaa/engine/device/Device;->device:Lcom/boyaa/engine/device/Device;

    return-object v0
.end method

.method public static getPhoneNumber()Ljava/lang/String;
    .locals 3

    .prologue
    .line 150
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getTelephonyManager()Landroid/telephony/TelephonyManager;

    move-result-object v1

    .line 151
    .local v1, "manager":Landroid/telephony/TelephonyManager;
    const/4 v2, 0x0

    .line 154
    .local v2, "phoneNumber":Ljava/lang/String;
    :try_start_0
    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 162
    :goto_0
    if-eqz v2, :cond_0

    .line 164
    .end local v2    # "phoneNumber":Ljava/lang/String;
    :goto_1
    return-object v2

    .line 155
    .restart local v2    # "phoneNumber":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 158
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 159
    const/4 v2, 0x0

    goto :goto_0

    .line 164
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    const-string v2, ""

    goto :goto_1
.end method

.method public static declared-synchronized getTelephonyManager()Landroid/telephony/TelephonyManager;
    .locals 3

    .prologue
    .line 139
    const-class v1, Lcom/boyaa/engine/device/Device;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/boyaa/engine/device/Device;->telephonyManager:Landroid/telephony/TelephonyManager;

    if-nez v0, :cond_0

    .line 140
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v2, "phone"

    invoke-virtual {v0, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    sput-object v0, Lcom/boyaa/engine/device/Device;->telephonyManager:Landroid/telephony/TelephonyManager;

    .line 142
    :cond_0
    sget-object v0, Lcom/boyaa/engine/device/Device;->telephonyManager:Landroid/telephony/TelephonyManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 139
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static getUUID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 146
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static hasStepCounter()Z
    .locals 2

    .prologue
    .line 270
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    .line 271
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v1, "android.hardware.sensor.stepcounter"

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    .line 273
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static keepScreenOn(Z)V
    .locals 3
    .param p0, "enable"    # Z

    .prologue
    .line 220
    move v0, p0

    .line 221
    .local v0, "bval":Z
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/boyaa/engine/device/Device$3;

    invoke-direct {v2, v0}, Lcom/boyaa/engine/device/Device$3;-><init>(Z)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 233
    return-void
.end method

.method public static native nativeAccelerometerEvent(FFFD)V
.end method

.method public static native nativeStepCounterEvent(I)V
.end method

.method public static openCamera(IIIIILjava/lang/String;Z)V
    .locals 1
    .param p0, "id"    # I
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "format"    # I
    .param p4, "quality"    # I
    .param p5, "path"    # Ljava/lang/String;
    .param p6, "edit"    # Z

    .prologue
    .line 305
    new-instance v0, Lcom/boyaa/engine/device/CameraImpl;

    invoke-direct {v0}, Lcom/boyaa/engine/device/CameraImpl;-><init>()V

    sput-object v0, Lcom/boyaa/engine/device/Device;->camera:Lcom/boyaa/engine/device/CameraImpl;

    .line 306
    sget-object v0, Lcom/boyaa/engine/device/Device;->camera:Lcom/boyaa/engine/device/CameraImpl;

    iput p0, v0, Lcom/boyaa/engine/device/CameraImpl;->id:I

    .line 307
    sget-object v0, Lcom/boyaa/engine/device/Device;->camera:Lcom/boyaa/engine/device/CameraImpl;

    iput-object p5, v0, Lcom/boyaa/engine/device/CameraImpl;->path:Ljava/lang/String;

    .line 308
    sget-object v0, Lcom/boyaa/engine/device/Device;->camera:Lcom/boyaa/engine/device/CameraImpl;

    iput-boolean p6, v0, Lcom/boyaa/engine/device/CameraImpl;->edit:Z

    .line 309
    sget-object v0, Lcom/boyaa/engine/device/Device;->camera:Lcom/boyaa/engine/device/CameraImpl;

    iput p3, v0, Lcom/boyaa/engine/device/CameraImpl;->format:I

    .line 310
    sget-object v0, Lcom/boyaa/engine/device/Device;->camera:Lcom/boyaa/engine/device/CameraImpl;

    iput p4, v0, Lcom/boyaa/engine/device/CameraImpl;->quality:I

    .line 311
    sget-object v0, Lcom/boyaa/engine/device/Device;->camera:Lcom/boyaa/engine/device/CameraImpl;

    iput p1, v0, Lcom/boyaa/engine/device/CameraImpl;->width:I

    .line 312
    sget-object v0, Lcom/boyaa/engine/device/Device;->camera:Lcom/boyaa/engine/device/CameraImpl;

    iput p2, v0, Lcom/boyaa/engine/device/CameraImpl;->height:I

    .line 313
    sget-object v0, Lcom/boyaa/engine/device/Device;->camera:Lcom/boyaa/engine/device/CameraImpl;

    invoke-virtual {v0}, Lcom/boyaa/engine/device/CameraImpl;->open()V

    .line 314
    return-void
.end method

.method public static openDialer(Ljava/lang/String;)V
    .locals 3
    .param p0, "number"    # Ljava/lang/String;

    .prologue
    .line 247
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.DIAL"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 248
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "tel:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 249
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 250
    return-void
.end method

.method public static openGallery(IIIILjava/lang/String;ZLjava/lang/String;)V
    .locals 1
    .param p0, "width"    # I
    .param p1, "height"    # I
    .param p2, "format"    # I
    .param p3, "quality"    # I
    .param p4, "path"    # Ljava/lang/String;
    .param p5, "edit"    # Z
    .param p6, "title"    # Ljava/lang/String;

    .prologue
    .line 318
    new-instance v0, Lcom/boyaa/engine/device/GalleryImpl;

    invoke-direct {v0}, Lcom/boyaa/engine/device/GalleryImpl;-><init>()V

    sput-object v0, Lcom/boyaa/engine/device/Device;->gallery:Lcom/boyaa/engine/device/GalleryImpl;

    .line 319
    sget-object v0, Lcom/boyaa/engine/device/Device;->gallery:Lcom/boyaa/engine/device/GalleryImpl;

    iput-object p4, v0, Lcom/boyaa/engine/device/GalleryImpl;->path:Ljava/lang/String;

    .line 320
    sget-object v0, Lcom/boyaa/engine/device/Device;->gallery:Lcom/boyaa/engine/device/GalleryImpl;

    iput-object p6, v0, Lcom/boyaa/engine/device/GalleryImpl;->title:Ljava/lang/String;

    .line 321
    sget-object v0, Lcom/boyaa/engine/device/Device;->gallery:Lcom/boyaa/engine/device/GalleryImpl;

    iput-boolean p5, v0, Lcom/boyaa/engine/device/GalleryImpl;->edit:Z

    .line 322
    sget-object v0, Lcom/boyaa/engine/device/Device;->gallery:Lcom/boyaa/engine/device/GalleryImpl;

    iput p0, v0, Lcom/boyaa/engine/device/GalleryImpl;->width:I

    .line 323
    sget-object v0, Lcom/boyaa/engine/device/Device;->gallery:Lcom/boyaa/engine/device/GalleryImpl;

    iput p1, v0, Lcom/boyaa/engine/device/GalleryImpl;->height:I

    .line 324
    sget-object v0, Lcom/boyaa/engine/device/Device;->gallery:Lcom/boyaa/engine/device/GalleryImpl;

    iput p2, v0, Lcom/boyaa/engine/device/GalleryImpl;->format:I

    .line 325
    sget-object v0, Lcom/boyaa/engine/device/Device;->gallery:Lcom/boyaa/engine/device/GalleryImpl;

    iput p3, v0, Lcom/boyaa/engine/device/GalleryImpl;->quality:I

    .line 326
    sget-object v0, Lcom/boyaa/engine/device/Device;->gallery:Lcom/boyaa/engine/device/GalleryImpl;

    invoke-virtual {v0}, Lcom/boyaa/engine/device/GalleryImpl;->open()V

    .line 328
    return-void
.end method

.method public static openSms(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p0, "number"    # Ljava/lang/String;
    .param p1, "content"    # Ljava/lang/String;

    .prologue
    .line 253
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "smsto:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 254
    .local v1, "uri":Ljava/lang/String;
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.SENDTO"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 255
    .local v0, "intent":Landroid/content/Intent;
    const-string v2, "sms_body"

    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 256
    const-string v2, "compose_mode"

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 257
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 258
    return-void
.end method

.method public static openUrl(Ljava/lang/String;)V
    .locals 4
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 236
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 237
    .local v1, "tmp":Ljava/lang/String;
    const-string v2, "http://"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "https://"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 238
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "http://"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 240
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 241
    .local v0, "intent":Landroid/content/Intent;
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 243
    return-void
.end method

.method public static setBrightness(F)V
    .locals 3
    .param p0, "level"    # F

    .prologue
    .line 207
    move v0, p0

    .line 208
    .local v0, "fVal":F
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/boyaa/engine/device/Device$2;

    invoke-direct {v2, v0}, Lcom/boyaa/engine/device/Device$2;-><init>(F)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 217
    return-void
.end method

.method public static showToast(Ljava/lang/String;II)V
    .locals 0
    .param p0, "text"    # Ljava/lang/String;
    .param p1, "vpos"    # I
    .param p2, "duration"    # I

    .prologue
    .line 203
    invoke-static {p0, p1, p2}, Lcom/boyaa/engine/device/ToastImpl;->showToast(Ljava/lang/String;II)V

    .line 204
    return-void
.end method

.method private static virtualLog(Ljava/lang/String;)V
    .locals 0
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 169
    return-void
.end method


# virtual methods
.method public init(Landroid/app/Activity;II)V
    .locals 2
    .param p1, "a"    # Landroid/app/Activity;
    .param p2, "activityRequestCodeBegin"    # I
    .param p3, "activityRequestPermissionCodeBegin"    # I

    .prologue
    .line 81
    sput-object p1, Lcom/boyaa/engine/device/Device;->activity:Landroid/app/Activity;

    .line 82
    move v0, p2

    .line 83
    .local v0, "code":I
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "code":I
    .local v1, "code":I
    sput v0, Lcom/boyaa/engine/device/CameraImpl;->REQ_ID_CAMERA:I

    .line 84
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "code":I
    .restart local v0    # "code":I
    sput v1, Lcom/boyaa/engine/device/CameraImpl;->REQ_ID_CROP:I

    .line 86
    add-int/lit8 v1, v0, 0x1

    .end local v0    # "code":I
    .restart local v1    # "code":I
    sput v0, Lcom/boyaa/engine/device/GalleryImpl;->REQ_ID_GALLERY:I

    .line 87
    add-int/lit8 v0, v1, 0x1

    .end local v1    # "code":I
    .restart local v0    # "code":I
    sput v1, Lcom/boyaa/engine/device/GalleryImpl;->REQ_ID_CROP:I

    .line 89
    invoke-static {}, Lcom/boyaa/engine/device/ContactsImpl;->init()V

    .line 90
    invoke-static {}, Lcom/boyaa/engine/device/PowerInfoImpl;->init()V

    .line 91
    invoke-static {}, Lcom/boyaa/engine/device/NetworkInfoImpl;->init()V

    .line 92
    invoke-static {}, Lcom/boyaa/engine/device/DialogImpl;->init()V

    .line 93
    invoke-static {}, Lcom/boyaa/engine/device/SensorImpl;->init()V

    .line 94
    invoke-static {}, Lcom/boyaa/engine/device/ShakeImpl;->init()V

    .line 95
    invoke-static {}, Lcom/boyaa/engine/device/ClipboardImpl;->Init()V

    .line 96
    invoke-static {p3}, Lcom/boyaa/engine/device/PermissionsImpl;->init(I)V

    .line 97
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)Z
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v0, 0x1

    .line 118
    sget-object v1, Lcom/boyaa/engine/device/Device;->camera:Lcom/boyaa/engine/device/CameraImpl;

    if-eqz v1, :cond_1

    .line 119
    sget-object v1, Lcom/boyaa/engine/device/Device;->camera:Lcom/boyaa/engine/device/CameraImpl;

    invoke-virtual {v1, p1, p2, p3}, Lcom/boyaa/engine/device/CameraImpl;->onActivityResult(IILandroid/content/Intent;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 130
    :cond_0
    :goto_0
    return v0

    .line 124
    :cond_1
    sget-object v1, Lcom/boyaa/engine/device/Device;->gallery:Lcom/boyaa/engine/device/GalleryImpl;

    if-eqz v1, :cond_2

    .line 125
    sget-object v1, Lcom/boyaa/engine/device/Device;->gallery:Lcom/boyaa/engine/device/GalleryImpl;

    invoke-virtual {v1, p1, p2, p3}, Lcom/boyaa/engine/device/GalleryImpl;->onActivityResult(IILandroid/content/Intent;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 130
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 100
    invoke-static {}, Lcom/boyaa/engine/device/DialogImpl;->onPause()V

    .line 101
    invoke-static {}, Lcom/boyaa/engine/device/SensorImpl;->onPause()V

    .line 102
    invoke-static {}, Lcom/boyaa/engine/device/ShakeImpl;->onPause()V

    .line 104
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)Z
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I

    .prologue
    .line 135
    invoke-static {p1, p2, p3}, Lcom/boyaa/engine/device/PermissionsImpl;->onRequestPermissionsResult(I[Ljava/lang/String;[I)Z

    move-result v0

    return v0
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 107
    invoke-static {}, Lcom/boyaa/engine/device/DialogImpl;->onResume()V

    .line 108
    invoke-static {}, Lcom/boyaa/engine/device/SensorImpl;->onResume()V

    .line 109
    invoke-static {}, Lcom/boyaa/engine/device/ShakeImpl;->onResume()V

    .line 110
    return-void
.end method

.method public runOnRenderThread(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 113
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/boyaa/engine/made/AppActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 114
    return-void
.end method
