.class Lcom/boyaa/engine/device/PowerInfoImpl$3;
.super Ljava/lang/Object;
.source "PowerInfoImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/device/PowerInfoImpl;->onPowerEvent(IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$type:I

.field private final synthetic val$value:Z


# direct methods
.method constructor <init>(IZ)V
    .locals 0

    .prologue
    .line 1
    iput p1, p0, Lcom/boyaa/engine/device/PowerInfoImpl$3;->val$type:I

    iput-boolean p2, p0, Lcom/boyaa/engine/device/PowerInfoImpl$3;->val$value:Z

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 17
    iget v0, p0, Lcom/boyaa/engine/device/PowerInfoImpl$3;->val$type:I

    iget-boolean v1, p0, Lcom/boyaa/engine/device/PowerInfoImpl$3;->val$value:Z

    invoke-static {v0, v1}, Lcom/boyaa/engine/device/PowerInfoImpl;->nativeEvent(IZ)V

    .line 18
    return-void
.end method
