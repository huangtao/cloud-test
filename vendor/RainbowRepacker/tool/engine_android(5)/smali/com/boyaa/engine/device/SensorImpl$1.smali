.class Lcom/boyaa/engine/device/SensorImpl$1;
.super Ljava/lang/Object;
.source "SensorImpl.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/device/SensorImpl;->catchAccelerometer(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$accData:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Ljava/util/ArrayList;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/engine/device/SensorImpl$1;->val$accData:Ljava/util/ArrayList;

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .prologue
    .line 177
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 13
    .param p1, "sensorEvent"    # Landroid/hardware/SensorEvent;

    .prologue
    .line 129
    iget-object v9, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v9}, Landroid/hardware/Sensor;->getType()I

    move-result v9

    const/4 v10, 0x1

    if-ne v9, v10, :cond_2

    .line 133
    iget-object v9, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v10, 0x0

    aget v9, v9, v10

    const v10, 0x411cf5c3    # 9.81f

    div-float v6, v9, v10

    .line 134
    .local v6, "x":F
    iget-object v9, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v10, 0x1

    aget v9, v9, v10

    const v10, 0x411cf5c3    # 9.81f

    div-float v7, v9, v10

    .line 135
    .local v7, "y":F
    iget-object v9, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v10, 0x2

    aget v9, v9, v10

    const v10, 0x411cf5c3    # 9.81f

    div-float v8, v9, v10

    .line 137
    .local v8, "z":F
    const-wide/16 v9, 0x0

    # getter for: Lcom/boyaa/engine/device/SensorImpl;->startTime:J
    invoke-static {}, Lcom/boyaa/engine/device/SensorImpl;->access$0()J

    move-result-wide v11

    cmp-long v9, v9, v11

    if-nez v9, :cond_0

    .line 138
    iget-wide v9, p1, Landroid/hardware/SensorEvent;->timestamp:J

    invoke-static {v9, v10}, Lcom/boyaa/engine/device/SensorImpl;->access$1(J)V

    .line 140
    :cond_0
    iget-wide v9, p1, Landroid/hardware/SensorEvent;->timestamp:J

    # getter for: Lcom/boyaa/engine/device/SensorImpl;->startTime:J
    invoke-static {}, Lcom/boyaa/engine/device/SensorImpl;->access$0()J

    move-result-wide v11

    sub-long/2addr v9, v11

    long-to-double v9, v9

    const-wide v11, 0x41cdcd6500000000L    # 1.0E9

    div-double v3, v9, v11

    .line 142
    .local v3, "t":D
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v9

    invoke-virtual {v9}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v9

    iget v1, v9, Landroid/content/res/Configuration;->orientation:I

    .line 143
    .local v1, "orientation":I
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v9

    const-string v10, "window"

    invoke-virtual {v9, v10}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/WindowManager;

    invoke-interface {v9}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v9

    invoke-virtual {v9}, Landroid/view/Display;->getRotation()I

    move-result v2

    .line 145
    .local v2, "rotation":I
    const/4 v9, 0x2

    if-ne v1, v9, :cond_3

    if-eqz v2, :cond_3

    .line 146
    move v5, v6

    .line 147
    .local v5, "tmp":F
    neg-float v6, v7

    .line 148
    move v7, v5

    .line 157
    .end local v5    # "tmp":F
    :cond_1
    :goto_0
    new-instance v0, Lcom/boyaa/engine/device/AccelerometerData;

    invoke-direct {v0}, Lcom/boyaa/engine/device/AccelerometerData;-><init>()V

    .line 158
    .local v0, "data":Lcom/boyaa/engine/device/AccelerometerData;
    iput v6, v0, Lcom/boyaa/engine/device/AccelerometerData;->x:F

    .line 159
    iput v7, v0, Lcom/boyaa/engine/device/AccelerometerData;->y:F

    .line 160
    iput v8, v0, Lcom/boyaa/engine/device/AccelerometerData;->z:F

    .line 161
    iput-wide v3, v0, Lcom/boyaa/engine/device/AccelerometerData;->timestamp:D

    .line 166
    # getter for: Lcom/boyaa/engine/device/SensorImpl;->syncThread:Ljava/lang/Object;
    invoke-static {}, Lcom/boyaa/engine/device/SensorImpl;->access$2()Ljava/lang/Object;

    move-result-object v10

    monitor-enter v10

    .line 167
    :try_start_0
    iget-object v9, p0, Lcom/boyaa/engine/device/SensorImpl$1;->val$accData:Ljava/util/ArrayList;

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 168
    const/4 v9, 0x1

    invoke-static {v9}, Lcom/boyaa/engine/device/SensorImpl;->access$3(Z)V

    .line 169
    # getter for: Lcom/boyaa/engine/device/SensorImpl;->syncThread:Ljava/lang/Object;
    invoke-static {}, Lcom/boyaa/engine/device/SensorImpl;->access$2()Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->notifyAll()V

    .line 166
    monitor-exit v10

    .line 172
    .end local v0    # "data":Lcom/boyaa/engine/device/AccelerometerData;
    .end local v1    # "orientation":I
    .end local v2    # "rotation":I
    .end local v3    # "t":D
    .end local v6    # "x":F
    .end local v7    # "y":F
    .end local v8    # "z":F
    :cond_2
    return-void

    .line 149
    .restart local v1    # "orientation":I
    .restart local v2    # "rotation":I
    .restart local v3    # "t":D
    .restart local v6    # "x":F
    .restart local v7    # "y":F
    .restart local v8    # "z":F
    :cond_3
    const/4 v9, 0x1

    if-ne v1, v9, :cond_1

    if-eqz v2, :cond_1

    .line 150
    move v5, v6

    .line 151
    .restart local v5    # "tmp":F
    move v6, v7

    .line 152
    neg-float v7, v5

    goto :goto_0

    .line 166
    .end local v5    # "tmp":F
    .restart local v0    # "data":Lcom/boyaa/engine/device/AccelerometerData;
    :catchall_0
    move-exception v9

    monitor-exit v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v9
.end method
