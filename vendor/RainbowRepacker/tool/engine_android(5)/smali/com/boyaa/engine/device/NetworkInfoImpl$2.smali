.class Lcom/boyaa/engine/device/NetworkInfoImpl$2;
.super Ljava/lang/Object;
.source "NetworkInfoImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/device/NetworkInfoImpl;->onNetworkEvent(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$valid:Z


# direct methods
.method constructor <init>(Z)V
    .locals 0

    .prologue
    .line 1
    iput-boolean p1, p0, Lcom/boyaa/engine/device/NetworkInfoImpl$2;->val$valid:Z

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 19
    iget-boolean v0, p0, Lcom/boyaa/engine/device/NetworkInfoImpl$2;->val$valid:Z

    invoke-static {v0}, Lcom/boyaa/engine/device/NetworkInfoImpl;->nativeEvent(Z)V

    .line 20
    return-void
.end method
