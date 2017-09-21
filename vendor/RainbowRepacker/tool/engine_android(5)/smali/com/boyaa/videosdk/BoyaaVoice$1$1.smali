.class Lcom/boyaa/videosdk/BoyaaVoice$1$1;
.super Ljava/lang/Object;
.source "BoyaaVoice.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/videosdk/BoyaaVoice$1;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/boyaa/videosdk/BoyaaVoice$1;


# direct methods
.method constructor <init>(Lcom/boyaa/videosdk/BoyaaVoice$1;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/videosdk/BoyaaVoice$1$1;->this$1:Lcom/boyaa/videosdk/BoyaaVoice$1;

    .line 784
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 789
    iget-object v0, p0, Lcom/boyaa/videosdk/BoyaaVoice$1$1;->this$1:Lcom/boyaa/videosdk/BoyaaVoice$1;

    # getter for: Lcom/boyaa/videosdk/BoyaaVoice$1;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;
    invoke-static {v0}, Lcom/boyaa/videosdk/BoyaaVoice$1;->access$0(Lcom/boyaa/videosdk/BoyaaVoice$1;)Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v0

    # invokes: Lcom/boyaa/videosdk/BoyaaVoice;->onAudioManagerChangedState()V
    invoke-static {v0}, Lcom/boyaa/videosdk/BoyaaVoice;->access$0(Lcom/boyaa/videosdk/BoyaaVoice;)V

    .line 790
    return-void
.end method
