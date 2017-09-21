.class Lcom/boyaa/enginedlqp/maindevelop/Game$20;
.super Landroid/os/Handler;
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
.field final synthetic this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;


# direct methods
.method constructor <init>(Lcom/boyaa/enginedlqp/maindevelop/Game;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$20;->this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;

    .line 1124
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 1129
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    .line 1138
    :goto_0
    return-void

    .line 1133
    :pswitch_0
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$20;->this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;

    # invokes: Lcom/boyaa/enginedlqp/maindevelop/Game;->socketSleepDead()V
    invoke-static {v0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->access$2(Lcom/boyaa/enginedlqp/maindevelop/Game;)V

    goto :goto_0

    .line 1129
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
