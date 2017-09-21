.class Lcom/boyaa/engine/device/Device$1;
.super Ljava/lang/Object;
.source "Device.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/engine/device/Device;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 42
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
    .line 63
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 4
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .prologue
    const/4 v3, 0x0

    .line 46
    iget-object v1, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v1}, Landroid/hardware/Sensor;->getType()I

    move-result v1

    const/16 v2, 0x13

    if-ne v1, v2, :cond_1

    .line 47
    # getter for: Lcom/boyaa/engine/device/Device;->stepNum:I
    invoke-static {}, Lcom/boyaa/engine/device/Device;->access$0()I

    move-result v1

    if-nez v1, :cond_0

    .line 48
    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v1, v1, v3

    float-to-int v1, v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {v1}, Lcom/boyaa/engine/device/Device;->access$1(I)V

    .line 50
    :cond_0
    iget-object v1, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v1, v1, v3

    # getter for: Lcom/boyaa/engine/device/Device;->stepNum:I
    invoke-static {}, Lcom/boyaa/engine/device/Device;->access$0()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    float-to-int v0, v1

    .line 51
    .local v0, "num":I
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getInstance()Lcom/boyaa/engine/device/Device;

    move-result-object v1

    new-instance v2, Lcom/boyaa/engine/device/Device$1$1;

    invoke-direct {v2, p0, v0}, Lcom/boyaa/engine/device/Device$1$1;-><init>(Lcom/boyaa/engine/device/Device$1;I)V

    invoke-virtual {v1, v2}, Lcom/boyaa/engine/device/Device;->runOnRenderThread(Ljava/lang/Runnable;)V

    .line 58
    .end local v0    # "num":I
    :cond_1
    return-void
.end method
