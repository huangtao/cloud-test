.class Lcom/boyaa/enginedlqp/maindevelop/Game$21;
.super Ljava/lang/Thread;
.source "Game.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/enginedlqp/maindevelop/Game;->startSocketCount()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private count:I

.field final synthetic this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;


# direct methods
.method constructor <init>(Lcom/boyaa/enginedlqp/maindevelop/Game;)V
    .locals 1

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$21;->this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;

    .line 1142
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 1143
    const/4 v0, 0x0

    iput v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$21;->count:I

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 1145
    :cond_0
    iget-object v1, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$21;->this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;

    # getter for: Lcom/boyaa/enginedlqp/maindevelop/Game;->mIsSocketSleeping:Z
    invoke-static {v1}, Lcom/boyaa/enginedlqp/maindevelop/Game;->access$3(Lcom/boyaa/enginedlqp/maindevelop/Game;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1161
    :goto_0
    return-void

    .line 1147
    :cond_1
    const-wide/16 v1, 0x3e8

    :try_start_0
    invoke-static {v1, v2}, Lcom/boyaa/enginedlqp/maindevelop/Game$21;->sleep(J)V

    .line 1148
    iget v1, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$21;->count:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$21;->count:I

    mul-int/lit16 v1, v1, 0x3e8

    const v2, 0x493e0

    if-lt v1, v2, :cond_0

    .line 1149
    iget-object v1, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$21;->this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;

    # getter for: Lcom/boyaa/enginedlqp/maindevelop/Game;->mSocketCounterHander:Landroid/os/Handler;
    invoke-static {v1}, Lcom/boyaa/enginedlqp/maindevelop/Game;->access$4(Lcom/boyaa/enginedlqp/maindevelop/Game;)Landroid/os/Handler;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1152
    :catch_0
    move-exception v0

    .line 1153
    .local v0, "e":Ljava/lang/InterruptedException;
    iget-object v1, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$21;->this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;

    # invokes: Lcom/boyaa/enginedlqp/maindevelop/Game;->socketWakeUp()V
    invoke-static {v1}, Lcom/boyaa/enginedlqp/maindevelop/Game;->access$5(Lcom/boyaa/enginedlqp/maindevelop/Game;)V

    .line 1154
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0
.end method
