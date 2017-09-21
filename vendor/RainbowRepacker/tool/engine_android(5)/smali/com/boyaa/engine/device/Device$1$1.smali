.class Lcom/boyaa/engine/device/Device$1$1;
.super Ljava/lang/Object;
.source "Device.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/device/Device$1;->onSensorChanged(Landroid/hardware/SensorEvent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/boyaa/engine/device/Device$1;

.field private final synthetic val$num:I


# direct methods
.method constructor <init>(Lcom/boyaa/engine/device/Device$1;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/engine/device/Device$1$1;->this$1:Lcom/boyaa/engine/device/Device$1;

    iput p2, p0, Lcom/boyaa/engine/device/Device$1$1;->val$num:I

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 54
    iget v0, p0, Lcom/boyaa/engine/device/Device$1$1;->val$num:I

    invoke-static {v0}, Lcom/boyaa/engine/device/Device;->nativeStepCounterEvent(I)V

    .line 55
    return-void
.end method
