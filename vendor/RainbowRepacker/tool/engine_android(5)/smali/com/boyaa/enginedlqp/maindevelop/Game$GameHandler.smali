.class public Lcom/boyaa/enginedlqp/maindevelop/Game$GameHandler;
.super Landroid/os/Handler;
.source "Game.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/enginedlqp/maindevelop/Game;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "GameHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;


# direct methods
.method public constructor <init>(Lcom/boyaa/enginedlqp/maindevelop/Game;)V
    .locals 0

    .prologue
    .line 1318
    iput-object p1, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$GameHandler;->this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 1321
    iget-object v0, p0, Lcom/boyaa/enginedlqp/maindevelop/Game$GameHandler;->this$0:Lcom/boyaa/enginedlqp/maindevelop/Game;

    invoke-virtual {v0, p1}, Lcom/boyaa/enginedlqp/maindevelop/Game;->onHandleMessage(Landroid/os/Message;)V

    .line 1322
    return-void
.end method
