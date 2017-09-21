.class Lcom/boyaa/engine/device/SensorImpl;
.super Ljava/lang/Object;
.source "SensorImpl.java"


# static fields
.field private static final SAMPLING_US:I = 0xf4240

.field private static askExit:Z

.field private static askThreadExit:Z

.field private static askThreadPause:Z

.field private static hasData:Z

.field private static interval:I

.field private static isThreadExit:Z

.field private static isThreadPause:Z

.field private static sensorDefault:Landroid/hardware/Sensor;

.field private static sensorManager:Landroid/hardware/SensorManager;

.field private static startTime:J

.field private static syncThread:Ljava/lang/Object;

.field private static volatile threadId:J


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const-wide/16 v2, 0x0

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 23
    sput-object v0, Lcom/boyaa/engine/device/SensorImpl;->sensorManager:Landroid/hardware/SensorManager;

    .line 24
    sput-object v0, Lcom/boyaa/engine/device/SensorImpl;->sensorDefault:Landroid/hardware/Sensor;

    .line 26
    sput v1, Lcom/boyaa/engine/device/SensorImpl;->interval:I

    .line 27
    sput-wide v2, Lcom/boyaa/engine/device/SensorImpl;->startTime:J

    .line 28
    sput-wide v2, Lcom/boyaa/engine/device/SensorImpl;->threadId:J

    .line 30
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/boyaa/engine/device/SensorImpl;->syncThread:Ljava/lang/Object;

    .line 31
    sput-boolean v1, Lcom/boyaa/engine/device/SensorImpl;->hasData:Z

    .line 33
    sput-boolean v1, Lcom/boyaa/engine/device/SensorImpl;->askExit:Z

    .line 34
    sput-boolean v1, Lcom/boyaa/engine/device/SensorImpl;->askThreadExit:Z

    .line 35
    sput-boolean v1, Lcom/boyaa/engine/device/SensorImpl;->isThreadExit:Z

    .line 37
    sput-boolean v1, Lcom/boyaa/engine/device/SensorImpl;->askThreadPause:Z

    .line 38
    sput-boolean v1, Lcom/boyaa/engine/device/SensorImpl;->isThreadPause:Z

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    return-void
.end method

.method static synthetic access$0()J
    .locals 2

    .prologue
    .line 27
    sget-wide v0, Lcom/boyaa/engine/device/SensorImpl;->startTime:J

    return-wide v0
.end method

.method static synthetic access$1(J)V
    .locals 0

    .prologue
    .line 27
    sput-wide p0, Lcom/boyaa/engine/device/SensorImpl;->startTime:J

    return-void
.end method

.method static synthetic access$2()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 30
    sget-object v0, Lcom/boyaa/engine/device/SensorImpl;->syncThread:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$3(Z)V
    .locals 0

    .prologue
    .line 31
    sput-boolean p0, Lcom/boyaa/engine/device/SensorImpl;->hasData:Z

    return-void
.end method

.method public static declared-synchronized catchAccelerometer(I)V
    .locals 16
    .param p0, "updatePerSecond"    # I

    .prologue
    .line 111
    const-class v10, Lcom/boyaa/engine/device/SensorImpl;

    monitor-enter v10

    :try_start_0
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    const-string v11, "android.hardware.sensor.accelerometer"

    invoke-virtual {v9, v11}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v4

    .line 112
    .local v4, "hasAcc":Z
    if-nez v4, :cond_1

    .line 246
    :cond_0
    :goto_0
    monitor-exit v10

    return-void

    .line 114
    :cond_1
    :try_start_1
    sget-wide v11, Lcom/boyaa/engine/device/SensorImpl;->threadId:J

    const-wide/16 v13, 0x0

    cmp-long v9, v11, v13

    if-gtz v9, :cond_0

    .line 116
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v11, "Sensor "

    invoke-direct {v9, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v11, "catchAccelerometer start"

    invoke-static {v9, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    invoke-static {}, Lcom/boyaa/engine/device/SensorImpl;->init()V

    .line 119
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Thread;->getId()J

    move-result-wide v11

    sput-wide v11, Lcom/boyaa/engine/device/SensorImpl;->threadId:J

    .line 120
    const v9, 0xf4240

    div-int v9, v9, p0

    sput v9, Lcom/boyaa/engine/device/SensorImpl;->interval:I

    .line 121
    new-instance v3, Landroid/os/HandlerThread;

    const-string v9, "SensorHandler"

    invoke-direct {v3, v9}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 122
    .local v3, "handlerThread":Landroid/os/HandlerThread;
    invoke-virtual {v3}, Landroid/os/HandlerThread;->start()V

    .line 123
    new-instance v2, Landroid/os/Handler;

    invoke-virtual {v3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v9

    invoke-direct {v2, v9}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 125
    .local v2, "handler":Landroid/os/Handler;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 126
    .local v0, "accData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/boyaa/engine/device/AccelerometerData;>;"
    new-instance v6, Lcom/boyaa/engine/device/SensorImpl$1;

    invoke-direct {v6, v0}, Lcom/boyaa/engine/device/SensorImpl$1;-><init>(Ljava/util/ArrayList;)V

    .line 180
    .local v6, "listener":Landroid/hardware/SensorEventListener;
    invoke-static {}, Lcom/boyaa/engine/device/SensorImpl;->getSensorManager()Landroid/hardware/SensorManager;

    move-result-object v7

    .line 181
    .local v7, "manager":Landroid/hardware/SensorManager;
    invoke-static {}, Lcom/boyaa/engine/device/SensorImpl;->getSensor()Landroid/hardware/Sensor;

    move-result-object v8

    .line 182
    .local v8, "sensor":Landroid/hardware/Sensor;
    sget v9, Lcom/boyaa/engine/device/SensorImpl;->interval:I

    invoke-virtual {v7, v6, v8, v9, v2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    .line 186
    :goto_1
    sget-object v11, Lcom/boyaa/engine/device/SensorImpl;->syncThread:Ljava/lang/Object;

    monitor-enter v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 190
    :try_start_2
    sget-object v9, Lcom/boyaa/engine/device/SensorImpl;->syncThread:Ljava/lang/Object;

    invoke-virtual {v9}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 194
    :goto_2
    :try_start_3
    sget-boolean v9, Lcom/boyaa/engine/device/SensorImpl;->askThreadExit:Z

    if-eqz v9, :cond_3

    .line 195
    const/4 v9, 0x0

    sput-boolean v9, Lcom/boyaa/engine/device/SensorImpl;->askThreadExit:Z

    .line 196
    const/4 v9, 0x1

    sput-boolean v9, Lcom/boyaa/engine/device/SensorImpl;->isThreadExit:Z

    .line 198
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v12, "Sensor "

    invoke-direct {v9, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v12, "exit2"

    invoke-static {v9, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 199
    invoke-virtual {v7, v6}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 200
    invoke-virtual {v3}, Landroid/os/HandlerThread;->isAlive()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 201
    invoke-virtual {v3}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 203
    :cond_2
    sget-object v9, Lcom/boyaa/engine/device/SensorImpl;->syncThread:Ljava/lang/Object;

    invoke-virtual {v9}, Ljava/lang/Object;->notifyAll()V

    .line 204
    monitor-exit v11
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 243
    :goto_3
    const-wide/16 v11, 0x0

    :try_start_4
    sput-wide v11, Lcom/boyaa/engine/device/SensorImpl;->threadId:J

    .line 244
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v11, "Sensor "

    invoke-direct {v9, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v11, "catchAccelerometer stop"

    invoke-static {v9, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_0

    .line 111
    .end local v0    # "accData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/boyaa/engine/device/AccelerometerData;>;"
    .end local v2    # "handler":Landroid/os/Handler;
    .end local v3    # "handlerThread":Landroid/os/HandlerThread;
    .end local v4    # "hasAcc":Z
    .end local v6    # "listener":Landroid/hardware/SensorEventListener;
    .end local v7    # "manager":Landroid/hardware/SensorManager;
    .end local v8    # "sensor":Landroid/hardware/Sensor;
    :catchall_0
    move-exception v9

    monitor-exit v10

    throw v9

    .line 207
    .restart local v0    # "accData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/boyaa/engine/device/AccelerometerData;>;"
    .restart local v2    # "handler":Landroid/os/Handler;
    .restart local v3    # "handlerThread":Landroid/os/HandlerThread;
    .restart local v4    # "hasAcc":Z
    .restart local v6    # "listener":Landroid/hardware/SensorEventListener;
    .restart local v7    # "manager":Landroid/hardware/SensorManager;
    .restart local v8    # "sensor":Landroid/hardware/Sensor;
    :cond_3
    :try_start_5
    sget-boolean v9, Lcom/boyaa/engine/device/SensorImpl;->askThreadPause:Z

    sget-boolean v12, Lcom/boyaa/engine/device/SensorImpl;->isThreadPause:Z

    if-eq v9, v12, :cond_4

    .line 208
    sget-boolean v9, Lcom/boyaa/engine/device/SensorImpl;->askThreadPause:Z

    sput-boolean v9, Lcom/boyaa/engine/device/SensorImpl;->isThreadPause:Z

    .line 210
    sget-boolean v9, Lcom/boyaa/engine/device/SensorImpl;->isThreadPause:Z

    if-eqz v9, :cond_6

    .line 211
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v12, "Sensor "

    invoke-direct {v9, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v12, "pause"

    invoke-static {v9, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    invoke-virtual {v7, v6}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 219
    :goto_4
    sget-object v9, Lcom/boyaa/engine/device/SensorImpl;->syncThread:Ljava/lang/Object;

    invoke-virtual {v9}, Ljava/lang/Object;->notifyAll()V

    .line 222
    :cond_4
    sget-boolean v9, Lcom/boyaa/engine/device/SensorImpl;->hasData:Z

    if-eqz v9, :cond_9

    .line 223
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-lt v5, v9, :cond_7

    .line 228
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 229
    const/4 v9, 0x0

    sput-boolean v9, Lcom/boyaa/engine/device/SensorImpl;->hasData:Z

    .line 230
    sget-boolean v9, Lcom/boyaa/engine/device/SensorImpl;->askExit:Z

    if-eqz v9, :cond_8

    .line 232
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v12, "Sensor "

    invoke-direct {v9, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v12, "exit"

    invoke-static {v9, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 233
    invoke-virtual {v7, v6}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 234
    invoke-virtual {v3}, Landroid/os/HandlerThread;->isAlive()Z

    move-result v9

    if-eqz v9, :cond_5

    .line 235
    invoke-virtual {v3}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 236
    :cond_5
    monitor-exit v11

    goto/16 :goto_3

    .line 186
    .end local v5    # "i":I
    :catchall_1
    move-exception v9

    monitor-exit v11
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :try_start_6
    throw v9
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 215
    :cond_6
    :try_start_7
    new-instance v9, Ljava/lang/StringBuilder;

    const-string v12, "Sensor "

    invoke-direct {v9, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v12, "resume"

    invoke-static {v9, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 216
    sget v9, Lcom/boyaa/engine/device/SensorImpl;->interval:I

    invoke-virtual {v7, v6, v8, v9, v2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;ILandroid/os/Handler;)Z

    goto :goto_4

    .line 224
    .restart local v5    # "i":I
    :cond_7
    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/boyaa/engine/device/AccelerometerData;

    .line 226
    .local v1, "data":Lcom/boyaa/engine/device/AccelerometerData;
    iget v9, v1, Lcom/boyaa/engine/device/AccelerometerData;->x:F

    iget v12, v1, Lcom/boyaa/engine/device/AccelerometerData;->y:F

    iget v13, v1, Lcom/boyaa/engine/device/AccelerometerData;->z:F

    iget-wide v14, v1, Lcom/boyaa/engine/device/AccelerometerData;->timestamp:D

    invoke-static {v9, v12, v13, v14, v15}, Lcom/boyaa/engine/device/SensorImpl;->nativeAccelerometerEvent(FFFD)V

    .line 223
    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    .line 238
    .end local v1    # "data":Lcom/boyaa/engine/device/AccelerometerData;
    :cond_8
    sget-object v9, Lcom/boyaa/engine/device/SensorImpl;->syncThread:Ljava/lang/Object;

    invoke-virtual {v9}, Ljava/lang/Object;->notifyAll()V

    .line 186
    .end local v5    # "i":I
    :cond_9
    monitor-exit v11
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    goto/16 :goto_1

    .line 191
    :catch_0
    move-exception v9

    goto/16 :goto_2
.end method

.method private static getSensor()Landroid/hardware/Sensor;
    .locals 2

    .prologue
    .line 101
    sget-object v1, Lcom/boyaa/engine/device/SensorImpl;->sensorDefault:Landroid/hardware/Sensor;

    if-nez v1, :cond_0

    .line 102
    invoke-static {}, Lcom/boyaa/engine/device/SensorImpl;->getSensorManager()Landroid/hardware/SensorManager;

    move-result-object v0

    .line 103
    .local v0, "manager":Landroid/hardware/SensorManager;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v1

    sput-object v1, Lcom/boyaa/engine/device/SensorImpl;->sensorDefault:Landroid/hardware/Sensor;

    .line 105
    :cond_0
    sget-object v1, Lcom/boyaa/engine/device/SensorImpl;->sensorDefault:Landroid/hardware/Sensor;

    return-object v1
.end method

.method private static getSensorManager()Landroid/hardware/SensorManager;
    .locals 2

    .prologue
    .line 94
    sget-object v0, Lcom/boyaa/engine/device/SensorImpl;->sensorManager:Landroid/hardware/SensorManager;

    if-nez v0, :cond_0

    .line 95
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const-string v1, "sensor"

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    sput-object v0, Lcom/boyaa/engine/device/SensorImpl;->sensorManager:Landroid/hardware/SensorManager;

    .line 97
    :cond_0
    sget-object v0, Lcom/boyaa/engine/device/SensorImpl;->sensorManager:Landroid/hardware/SensorManager;

    return-object v0
.end method

.method public static init()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 45
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/boyaa/engine/device/SensorImpl;->threadId:J

    .line 46
    sput-boolean v2, Lcom/boyaa/engine/device/SensorImpl;->hasData:Z

    .line 48
    sput-boolean v2, Lcom/boyaa/engine/device/SensorImpl;->askExit:Z

    .line 49
    sput-boolean v2, Lcom/boyaa/engine/device/SensorImpl;->askThreadExit:Z

    .line 50
    sput-boolean v2, Lcom/boyaa/engine/device/SensorImpl;->isThreadExit:Z

    .line 51
    sput-boolean v2, Lcom/boyaa/engine/device/SensorImpl;->askThreadPause:Z

    .line 52
    sput-boolean v2, Lcom/boyaa/engine/device/SensorImpl;->isThreadPause:Z

    .line 53
    return-void
.end method

.method static native nativeAccelerometerEvent(FFFD)V
.end method

.method public static onPause()V
    .locals 5

    .prologue
    .line 75
    sget-wide v1, Lcom/boyaa/engine/device/SensorImpl;->threadId:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-lez v1, :cond_0

    .line 76
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Sensor "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "onPause begin"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    sget-object v2, Lcom/boyaa/engine/device/SensorImpl;->syncThread:Ljava/lang/Object;

    monitor-enter v2

    .line 78
    const/4 v1, 0x1

    :try_start_0
    sput-boolean v1, Lcom/boyaa/engine/device/SensorImpl;->askThreadPause:Z

    .line 79
    sget-object v1, Lcom/boyaa/engine/device/SensorImpl;->syncThread:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 80
    .local v0, "ex":Ljava/lang/InterruptedException;
    :goto_0
    sget-boolean v1, Lcom/boyaa/engine/device/SensorImpl;->isThreadPause:Z

    if-eqz v1, :cond_1

    .line 77
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 89
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Sensor "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "onPause end"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    :cond_0
    return-void

    .line 83
    :cond_1
    :try_start_1
    sget-object v1, Lcom/boyaa/engine/device/SensorImpl;->syncThread:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 84
    :catch_0
    move-exception v0

    .line 85
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 77
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public static onResume()V
    .locals 5

    .prologue
    .line 56
    sget-wide v1, Lcom/boyaa/engine/device/SensorImpl;->threadId:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-lez v1, :cond_0

    .line 57
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Sensor "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "onResume begin"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    sget-object v2, Lcom/boyaa/engine/device/SensorImpl;->syncThread:Ljava/lang/Object;

    monitor-enter v2

    .line 59
    const/4 v1, 0x0

    :try_start_0
    sput-boolean v1, Lcom/boyaa/engine/device/SensorImpl;->askThreadPause:Z

    .line 60
    const/4 v1, 0x1

    sput-boolean v1, Lcom/boyaa/engine/device/SensorImpl;->isThreadPause:Z

    .line 61
    sget-object v1, Lcom/boyaa/engine/device/SensorImpl;->syncThread:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 62
    .local v0, "ex":Ljava/lang/InterruptedException;
    :goto_0
    sget-boolean v1, Lcom/boyaa/engine/device/SensorImpl;->isThreadPause:Z

    if-nez v1, :cond_1

    .line 58
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Sensor "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "onResume end"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 72
    :cond_0
    return-void

    .line 64
    :cond_1
    :try_start_1
    sget-object v1, Lcom/boyaa/engine/device/SensorImpl;->syncThread:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 65
    :catch_0
    move-exception v0

    .line 66
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 58
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public static releaseAccelerometer()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 255
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Sensor "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "releaseAccelerometer begin"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 256
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v1

    sget-wide v3, Lcom/boyaa/engine/device/SensorImpl;->threadId:J

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    .line 257
    sput-boolean v5, Lcom/boyaa/engine/device/SensorImpl;->askExit:Z

    .line 271
    .local v0, "ex":Ljava/lang/InterruptedException;
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Sensor "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "releaseAccelerometer end"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 272
    return-void

    .line 259
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :cond_0
    sget-object v2, Lcom/boyaa/engine/device/SensorImpl;->syncThread:Ljava/lang/Object;

    monitor-enter v2

    .line 260
    const/4 v1, 0x1

    :try_start_0
    sput-boolean v1, Lcom/boyaa/engine/device/SensorImpl;->askThreadExit:Z

    .line 261
    sget-object v1, Lcom/boyaa/engine/device/SensorImpl;->syncThread:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 262
    .restart local v0    # "ex":Ljava/lang/InterruptedException;
    :goto_1
    sget-boolean v1, Lcom/boyaa/engine/device/SensorImpl;->isThreadExit:Z

    if-eqz v1, :cond_1

    .line 259
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 264
    :cond_1
    :try_start_1
    sget-object v1, Lcom/boyaa/engine/device/SensorImpl;->syncThread:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 265
    :catch_0
    move-exception v0

    .line 266
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1
.end method
