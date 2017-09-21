.class Lcom/boyaa/engine/device/CameraImpl$2;
.super Ljava/lang/Object;
.source "CameraImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/device/CameraImpl;->onResultSuccess(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/engine/device/CameraImpl;

.field private final synthetic val$name:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/engine/device/CameraImpl;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/engine/device/CameraImpl$2;->this$0:Lcom/boyaa/engine/device/CameraImpl;

    iput-object p2, p0, Lcom/boyaa/engine/device/CameraImpl$2;->val$name:Ljava/lang/String;

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 71
    const/4 v0, 0x1

    iget-object v1, p0, Lcom/boyaa/engine/device/CameraImpl$2;->val$name:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/boyaa/engine/device/CameraImpl;->nativeEvent(ILjava/lang/String;)V

    .line 72
    return-void
.end method
