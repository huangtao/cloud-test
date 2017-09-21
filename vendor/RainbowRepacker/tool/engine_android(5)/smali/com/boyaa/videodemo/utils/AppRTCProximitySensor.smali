.class public Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;
.super Ljava/lang/Object;
.source "AppRTCProximitySensor.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "AppRTCProximitySensor"


# instance fields
.field private lastStateReportIsNear:Z

.field private final onSensorStateListener:Ljava/lang/Runnable;

.field private proximitySensor:Landroid/hardware/Sensor;

.field private final sensorManager:Landroid/hardware/SensorManager;

.field private final threadChecker:Lcom/boyaa/videodemo/utils/ThreadUtils$ThreadChecker;


# direct methods
.method private constructor <init>(Landroid/content/Context;Ljava/lang/Runnable;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "sensorStateListener"    # Ljava/lang/Runnable;

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Lcom/boyaa/videodemo/utils/ThreadUtils$ThreadChecker;

    invoke-direct {v0}, Lcom/boyaa/videodemo/utils/ThreadUtils$ThreadChecker;-><init>()V

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->threadChecker:Lcom/boyaa/videodemo/utils/ThreadUtils$ThreadChecker;

    .line 42
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->proximitySensor:Landroid/hardware/Sensor;

    .line 43
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->lastStateReportIsNear:Z

    .line 52
    const-string v0, "AppRTCProximitySensor"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "AppRTCProximitySensor"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/boyaa/videodemo/utils/AppRTCUtils;->getThreadInfo()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    iput-object p2, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->onSensorStateListener:Ljava/lang/Runnable;

    .line 55
    const-string v0, "sensor"

    .line 54
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->sensorManager:Landroid/hardware/SensorManager;

    .line 56
    return-void
.end method

.method static create(Landroid/content/Context;Ljava/lang/Runnable;)Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "sensorStateListener"    # Ljava/lang/Runnable;

    .prologue
    .line 48
    new-instance v0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;

    invoke-direct {v0, p0, p1}, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;-><init>(Landroid/content/Context;Ljava/lang/Runnable;)V

    return-object v0
.end method

.method private initDefaultSensor()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 131
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->proximitySensor:Landroid/hardware/Sensor;

    if-eqz v1, :cond_0

    .line 139
    :goto_0
    return v0

    .line 134
    :cond_0
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->sensorManager:Landroid/hardware/SensorManager;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v1

    iput-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->proximitySensor:Landroid/hardware/Sensor;

    .line 135
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->proximitySensor:Landroid/hardware/Sensor;

    if-nez v1, :cond_1

    .line 136
    const/4 v0, 0x0

    goto :goto_0

    .line 138
    :cond_1
    invoke-direct {p0}, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->logProximitySensorInfo()V

    goto :goto_0
.end method

.method private logProximitySensorInfo()V
    .locals 3

    .prologue
    .line 144
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->proximitySensor:Landroid/hardware/Sensor;

    if-nez v1, :cond_0

    .line 168
    :goto_0
    return-void

    .line 147
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Proximity sensor: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 148
    .local v0, "info":Ljava/lang/StringBuilder;
    const-string v1, "name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->proximitySensor:Landroid/hardware/Sensor;

    invoke-virtual {v2}, Landroid/hardware/Sensor;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    const-string v1, ", vendor: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->proximitySensor:Landroid/hardware/Sensor;

    invoke-virtual {v2}, Landroid/hardware/Sensor;->getVendor()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    const-string v1, ", power: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->proximitySensor:Landroid/hardware/Sensor;

    invoke-virtual {v2}, Landroid/hardware/Sensor;->getPower()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 151
    const-string v1, ", resolution: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->proximitySensor:Landroid/hardware/Sensor;

    invoke-virtual {v2}, Landroid/hardware/Sensor;->getResolution()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 152
    const-string v1, ", max range: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->proximitySensor:Landroid/hardware/Sensor;

    invoke-virtual {v2}, Landroid/hardware/Sensor;->getMaximumRange()F

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 153
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x9

    if-lt v1, v2, :cond_1

    .line 155
    const-string v1, ", min delay: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->proximitySensor:Landroid/hardware/Sensor;

    invoke-virtual {v2}, Landroid/hardware/Sensor;->getMinDelay()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 157
    :cond_1
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x14

    if-lt v1, v2, :cond_2

    .line 159
    const-string v1, ", type: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->proximitySensor:Landroid/hardware/Sensor;

    invoke-virtual {v2}, Landroid/hardware/Sensor;->getStringType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    :cond_2
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_3

    .line 163
    const-string v1, ", max delay: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->proximitySensor:Landroid/hardware/Sensor;

    invoke-virtual {v2}, Landroid/hardware/Sensor;->getMaxDelay()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 164
    const-string v1, ", reporting mode: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->proximitySensor:Landroid/hardware/Sensor;

    invoke-virtual {v2}, Landroid/hardware/Sensor;->getReportingMode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 165
    const-string v1, ", isWakeUpSensor: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->proximitySensor:Landroid/hardware/Sensor;

    invoke-virtual {v2}, Landroid/hardware/Sensor;->isWakeUpSensor()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 167
    :cond_3
    const-string v1, "AppRTCProximitySensor"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method


# virtual methods
.method public final onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 2
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .prologue
    .line 92
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->threadChecker:Lcom/boyaa/videodemo/utils/ThreadUtils$ThreadChecker;

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 93
    invoke-virtual {p1}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0}, Lcom/boyaa/videodemo/utils/AppRTCUtils;->assertIsTrue(Z)V

    .line 94
    if-nez p2, :cond_0

    .line 95
    const-string v0, "AppRTCProximitySensor"

    const-string v1, "The values returned by this sensor cannot be trusted"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    :cond_0
    return-void

    .line 93
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 6
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 101
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->threadChecker:Lcom/boyaa/videodemo/utils/ThreadUtils$ThreadChecker;

    invoke-virtual {v1}, Lcom/boyaa/videodemo/utils/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 102
    iget-object v1, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v1}, Landroid/hardware/Sensor;->getType()I

    move-result v1

    const/16 v4, 0x8

    if-ne v1, v4, :cond_1

    move v1, v2

    :goto_0
    invoke-static {v1}, Lcom/boyaa/videodemo/utils/AppRTCUtils;->assertIsTrue(Z)V

    .line 105
    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v0, v1, v3

    .line 106
    .local v0, "distanceInCentimeters":F
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->proximitySensor:Landroid/hardware/Sensor;

    invoke-virtual {v1}, Landroid/hardware/Sensor;->getMaximumRange()F

    move-result v1

    cmpg-float v1, v0, v1

    if-gez v1, :cond_2

    .line 107
    const-string v1, "AppRTCProximitySensor"

    const-string v4, "Proximity sensor => NEAR state"

    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    iput-boolean v2, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->lastStateReportIsNear:Z

    .line 116
    :goto_1
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->onSensorStateListener:Ljava/lang/Runnable;

    if-eqz v1, :cond_0

    .line 117
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->onSensorStateListener:Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 120
    :cond_0
    const-string v1, "AppRTCProximitySensor"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "onSensorChanged"

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/boyaa/videodemo/utils/AppRTCUtils;->getThreadInfo()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ": "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 121
    const-string v4, "accuracy="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v4, p1, Landroid/hardware/SensorEvent;->accuracy:I

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 122
    const-string v4, ", timestamp="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v4, p1, Landroid/hardware/SensorEvent;->timestamp:J

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ", distance="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v3, v4, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 120
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    return-void

    .end local v0    # "distanceInCentimeters":F
    :cond_1
    move v1, v3

    .line 102
    goto :goto_0

    .line 110
    .restart local v0    # "distanceInCentimeters":F
    :cond_2
    const-string v1, "AppRTCProximitySensor"

    const-string v2, "Proximity sensor => FAR state"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    iput-boolean v3, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->lastStateReportIsNear:Z

    goto :goto_1
.end method

.method public sensorReportsNearState()Z
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->threadChecker:Lcom/boyaa/videodemo/utils/ThreadUtils$ThreadChecker;

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 87
    iget-boolean v0, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->lastStateReportIsNear:Z

    return v0
.end method

.method public start()Z
    .locals 3

    .prologue
    .line 63
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->threadChecker:Lcom/boyaa/videodemo/utils/ThreadUtils$ThreadChecker;

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 64
    const-string v0, "AppRTCProximitySensor"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "start"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/boyaa/videodemo/utils/AppRTCUtils;->getThreadInfo()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    invoke-direct {p0}, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->initDefaultSensor()Z

    move-result v0

    if-nez v0, :cond_0

    .line 67
    const/4 v0, 0x0

    .line 71
    :goto_0
    return v0

    .line 69
    :cond_0
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->sensorManager:Landroid/hardware/SensorManager;

    .line 70
    iget-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->proximitySensor:Landroid/hardware/Sensor;

    const/4 v2, 0x3

    .line 69
    invoke-virtual {v0, p0, v1, v2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 71
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public stop()V
    .locals 3

    .prologue
    .line 76
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->threadChecker:Lcom/boyaa/videodemo/utils/ThreadUtils$ThreadChecker;

    invoke-virtual {v0}, Lcom/boyaa/videodemo/utils/ThreadUtils$ThreadChecker;->checkIsOnValidThread()V

    .line 77
    const-string v0, "AppRTCProximitySensor"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "stop"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/boyaa/videodemo/utils/AppRTCUtils;->getThreadInfo()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->proximitySensor:Landroid/hardware/Sensor;

    if-nez v0, :cond_0

    .line 82
    :goto_0
    return-void

    .line 81
    :cond_0
    iget-object v0, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/boyaa/videodemo/utils/AppRTCProximitySensor;->proximitySensor:Landroid/hardware/Sensor;

    invoke-virtual {v0, p0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;)V

    goto :goto_0
.end method
