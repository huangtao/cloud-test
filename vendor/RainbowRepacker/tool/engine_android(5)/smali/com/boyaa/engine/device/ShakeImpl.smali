.class public Lcom/boyaa/engine/device/ShakeImpl;
.super Ljava/lang/Object;
.source "ShakeImpl.java"


# static fields
.field private static final SAMPLING_US:I = 0xf4240

.field private static handler:Landroid/os/Handler;

.field private static handlerThread:Landroid/os/HandlerThread;

.field private static interval:I

.field private static listener:Landroid/hardware/SensorEventListener;

.field private static sensorDefault:Landroid/hardware/Sensor;

.field private static sensorManager:Landroid/hardware/SensorManager;

.field private static startTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 13
    sput-object v0, Lcom/boyaa/engine/device/ShakeImpl;->sensorManager:Landroid/hardware/SensorManager;

    .line 14
    sput-object v0, Lcom/boyaa/engine/device/ShakeImpl;->sensorDefault:Landroid/hardware/Sensor;

    .line 16
    sput-object v0, Lcom/boyaa/engine/device/ShakeImpl;->handlerThread:Landroid/os/HandlerThread;

    .line 17
    sput-object v0, Lcom/boyaa/engine/device/ShakeImpl;->handler:Landroid/os/Handler;

    .line 18
    sput-object v0, Lcom/boyaa/engine/device/ShakeImpl;->listener:Landroid/hardware/SensorEventListener;

    .line 21
    const/4 v0, 0x0

    sput v0, Lcom/boyaa/engine/device/ShakeImpl;->interval:I

    .line 22
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/boyaa/engine/device/ShakeImpl;->startTime:J

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    return-void
.end method

.method static synthetic access$0()J
    .locals 2

    .prologue
    .line 22
    sget-wide v0, Lcom/boyaa/engine/device/ShakeImpl;->startTime:J

    return-wide v0
.end method

.method static synthetic access$1(J)V
    .locals 0

    .prologue
    .line 22
    sput-wide p0, Lcom/boyaa/engine/device/ShakeImpl;->startTime:J

    return-void
.end method

.method private static getSensor()Landroid/hardware/Sensor;
    .locals 2

    .prologue
    .line 57
    sget-object v1, Lcom/boyaa/engine/device/ShakeImpl;->sensorDefault:Landroid/hardware/Sensor;

    if-nez v1, :cond_0

    .line 58
    invoke-static {}, Lcom/boyaa/engine/device/ShakeImpl;->getSensorManager()Landroid/hardware/SensorManager;

    move-result-object v0

    .line 59
    .local v0, "manager":Landroid/hardware/SensorManager;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v1

    sput-object v1, Lcom/boyaa/engine/device/ShakeImpl;->sensorDefault:Landroid/hardware/Sensor;

    .line 61
    :cond_0
    sget-object v1, Lcom/boyaa/engine/device/ShakeImpl;->sensorDefault:Landroid/hardware/Sensor;

    return-object v1
.end method

.method private static getSensorManager()Landroid/hardware/SensorManager;
    .locals 2

    .prologue
    .line 50
    sget-object v0, Lcom/boyaa/engine/device/ShakeImpl;->sensorManager:Landroid/hardware/SensorManager;

    if-nez v0, :cond_0

    .line 51
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "sensor"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    sput-object v0, Lcom/boyaa/engine/device/ShakeImpl;->sensorManager:Landroid/hardware/SensorManager;

    .line 53
    :cond_0
    sget-object v0, Lcom/boyaa/engine/device/ShakeImpl;->sensorManager:Landroid/hardware/SensorManager;

    return-object v0
.end method

.method public static init()V
    .locals 0

    .prologue
    .line 30
    return-void
.end method

.method public static onPause()V
    .locals 3

    .prologue
    .line 41
    sget-object v2, Lcom/boyaa/engine/device/ShakeImpl;->listener:Landroid/hardware/SensorEventListener;

    if-eqz v2, :cond_0

    .line 43
    invoke-static {}, Lcom/boyaa/engine/device/ShakeImpl;->getSensorManager()Landroid/hardware/SensorManager;

    move-result-object v0

    .line 44
    .local v0, "manager":Landroid/hardware/SensorManager;
    invoke-static {}, Lcom/boyaa/engine/device/ShakeImpl;->getSensor()Landroid/hardware/Sensor;

    move-result-object v1

    .line 45
    .local v1, "sensor":Landroid/hardware/Sensor;
    sget-object v2, Lcom/boyaa/engine/device/ShakeImpl;->listener:Landroid/hardware/SensorEventListener;

    invoke-virtual {v0, v2, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    .line 47
    :cond_0
    return-void
.end method

.method public static onResume()V
    .locals 5

    .prologue
    .line 32
    sget-object v2, Lcom/boyaa/engine/device/ShakeImpl;->listener:Landroid/hardware/SensorEventListener;

    if-eqz v2, :cond_0

    .line 34
    invoke-static {}, Lcom/boyaa/engine/device/ShakeImpl;->getSensorManager()Landroid/hardware/SensorManager;

    move-result-object v0

    .line 35
    .local v0, "manager":Landroid/hardware/SensorManager;
    invoke-static {}, Lcom/boyaa/engine/device/ShakeImpl;->getSensor()Landroid/hardware/Sensor;

    move-result-object v1

    .line 36
    .local v1, "sensor":Landroid/hardware/Sensor;
    sget-object v2, Lcom/boyaa/engine/device/ShakeImpl;->listener:Landroid/hardware/SensorEventListener;

    sget v3, Lcom/boyaa/engine/device/ShakeImpl;->interval:I

    sget-object v4, Lcom/boyaa/engine/device/ShakeImpl;->handler:Landroid/os/Handler;

    invoke-virtual {v0, v2, v1, v3, v4}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    .line 38
    :cond_0
    return-void
.end method

.method public static startAccelerometer(I)V
    .locals 5
    .param p0, "samplePerSecond"    # I

    .prologue
    .line 66
    const v2, 0xf4240

    div-int/2addr v2, p0

    sput v2, Lcom/boyaa/engine/device/ShakeImpl;->interval:I

    .line 67
    sget-object v2, Lcom/boyaa/engine/device/ShakeImpl;->listener:Landroid/hardware/SensorEventListener;

    if-eqz v2, :cond_0

    .line 98
    :goto_0
    return-void

    .line 68
    :cond_0
    new-instance v2, Landroid/os/HandlerThread;

    const-string v3, "ShakeHandler"

    invoke-direct {v2, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    sput-object v2, Lcom/boyaa/engine/device/ShakeImpl;->handlerThread:Landroid/os/HandlerThread;

    .line 69
    sget-object v2, Lcom/boyaa/engine/device/ShakeImpl;->handlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->start()V

    .line 70
    new-instance v2, Landroid/os/Handler;

    sget-object v3, Lcom/boyaa/engine/device/ShakeImpl;->handlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v2, Lcom/boyaa/engine/device/ShakeImpl;->handler:Landroid/os/Handler;

    .line 72
    new-instance v2, Lcom/boyaa/engine/device/ShakeImpl$1;

    invoke-direct {v2}, Lcom/boyaa/engine/device/ShakeImpl$1;-><init>()V

    sput-object v2, Lcom/boyaa/engine/device/ShakeImpl;->listener:Landroid/hardware/SensorEventListener;

    .line 95
    invoke-static {}, Lcom/boyaa/engine/device/ShakeImpl;->getSensorManager()Landroid/hardware/SensorManager;

    move-result-object v0

    .line 96
    .local v0, "manager":Landroid/hardware/SensorManager;
    invoke-static {}, Lcom/boyaa/engine/device/ShakeImpl;->getSensor()Landroid/hardware/Sensor;

    move-result-object v1

    .line 97
    .local v1, "sensor":Landroid/hardware/Sensor;
    sget-object v2, Lcom/boyaa/engine/device/ShakeImpl;->listener:Landroid/hardware/SensorEventListener;

    sget v3, Lcom/boyaa/engine/device/ShakeImpl;->interval:I

    sget-object v4, Lcom/boyaa/engine/device/ShakeImpl;->handler:Landroid/os/Handler;

    invoke-virtual {v0, v2, v1, v3, v4}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    goto :goto_0
.end method

.method public static stopAccelerometer()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 101
    sget-object v2, Lcom/boyaa/engine/device/ShakeImpl;->listener:Landroid/hardware/SensorEventListener;

    if-eqz v2, :cond_0

    .line 103
    invoke-static {}, Lcom/boyaa/engine/device/ShakeImpl;->getSensorManager()Landroid/hardware/SensorManager;

    move-result-object v0

    .line 104
    .local v0, "manager":Landroid/hardware/SensorManager;
    invoke-static {}, Lcom/boyaa/engine/device/ShakeImpl;->getSensor()Landroid/hardware/Sensor;

    move-result-object v1

    .line 105
    .local v1, "sensor":Landroid/hardware/Sensor;
    sget-object v2, Lcom/boyaa/engine/device/ShakeImpl;->listener:Landroid/hardware/SensorEventListener;

    invoke-virtual {v0, v2, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    .line 106
    sput-object v3, Lcom/boyaa/engine/device/ShakeImpl;->listener:Landroid/hardware/SensorEventListener;

    .line 108
    sget-object v2, Lcom/boyaa/engine/device/ShakeImpl;->handlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->quit()Z

    .line 109
    sput-object v3, Lcom/boyaa/engine/device/ShakeImpl;->handlerThread:Landroid/os/HandlerThread;

    .line 110
    sput-object v3, Lcom/boyaa/engine/device/ShakeImpl;->handler:Landroid/os/Handler;

    .line 112
    :cond_0
    return-void
.end method
