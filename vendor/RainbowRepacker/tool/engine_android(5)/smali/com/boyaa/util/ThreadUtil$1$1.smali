.class Lcom/boyaa/util/ThreadUtil$1$1;
.super Ljava/lang/Object;
.source "ThreadUtil.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/util/ThreadUtil$1;->onAfterUIRun()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/boyaa/util/ThreadUtil$1;


# direct methods
.method constructor <init>(Lcom/boyaa/util/ThreadUtil$1;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/util/ThreadUtil$1$1;->this$1:Lcom/boyaa/util/ThreadUtil$1;

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 66
    const-string v0, "sound"

    const-string v1, "PreloadSound finished-----"

    invoke-static {v0, v1}, Lcom/boyaa/app/debug/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v0

    .line 68
    const-string v1, "preloadSound"

    const-string v2, ""

    .line 67
    invoke-virtual {v0, v1, v2}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    return-void
.end method
