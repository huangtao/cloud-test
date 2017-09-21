.class Lcom/boyaa/engine/device/ShakeImpl$1;
.super Ljava/lang/Object;
.source "ShakeImpl.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/device/ShakeImpl;->startAccelerometer(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .prologue
    .line 92
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 9
    .param p1, "sensorEvent"    # Landroid/hardware/SensorEvent;

    .prologue
    const/4 v8, 0x1

    const v7, 0x411cf5c3    # 9.81f

    .line 75
    iget-object v5, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v5}, Landroid/hardware/Sensor;->getType()I

    move-result v5

    if-ne v5, v8, :cond_1

    .line 77
    iget-object v5, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v6, 0x0

    aget v5, v5, v6

    div-float v2, v5, v7

    .line 78
    .local v2, "x":F
    iget-object v5, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v5, v5, v8

    div-float v3, v5, v7

    .line 79
    .local v3, "y":F
    iget-object v5, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v6, 0x2

    aget v5, v5, v6

    div-float v4, v5, v7

    .line 81
    .local v4, "z":F
    const-wide/16 v5, 0x0

    # getter for: Lcom/boyaa/engine/device/ShakeImpl;->startTime:J
    invoke-static {}, Lcom/boyaa/engine/device/ShakeImpl;->access$0()J

    move-result-wide v7

    cmp-long v5, v5, v7

    if-nez v5, :cond_0

    .line 82
    iget-wide v5, p1, Landroid/hardware/SensorEvent;->timestamp:J

    invoke-static {v5, v6}, Lcom/boyaa/engine/device/ShakeImpl;->access$1(J)V

    .line 84
    :cond_0
    iget-wide v5, p1, Landroid/hardware/SensorEvent;->timestamp:J

    # getter for: Lcom/boyaa/engine/device/ShakeImpl;->startTime:J
    invoke-static {}, Lcom/boyaa/engine/device/ShakeImpl;->access$0()J

    move-result-wide v7

    sub-long/2addr v5, v7

    long-to-double v5, v5

    const-wide v7, 0x412e848000000000L    # 1000000.0

    div-double v0, v5, v7

    .line 85
    .local v0, "t":D
    invoke-static {v2, v3, v4, v0, v1}, Lcom/boyaa/engine/device/Device;->nativeAccelerometerEvent(FFFD)V

    .line 87
    .end local v0    # "t":D
    .end local v2    # "x":F
    .end local v3    # "y":F
    .end local v4    # "z":F
    :cond_1
    return-void
.end method
