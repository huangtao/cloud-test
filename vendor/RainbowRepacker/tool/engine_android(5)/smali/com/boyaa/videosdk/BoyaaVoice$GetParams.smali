.class public Lcom/boyaa/videosdk/BoyaaVoice$GetParams;
.super Landroid/os/AsyncTask;
.source "BoyaaVoice.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/videosdk/BoyaaVoice;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "GetParams"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Object;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/videosdk/BoyaaVoice;


# direct methods
.method public constructor <init>(Lcom/boyaa/videosdk/BoyaaVoice;)V
    .locals 0

    .prologue
    .line 348
    iput-object p1, p0, Lcom/boyaa/videosdk/BoyaaVoice$GetParams;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 2
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 353
    iget-object v0, p0, Lcom/boyaa/videosdk/BoyaaVoice$GetParams;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    invoke-virtual {v0}, Lcom/boyaa/videosdk/BoyaaVoice;->getSDKParams()I

    move-result v0

    if-gtz v0, :cond_0

    .line 355
    iget-object v0, p0, Lcom/boyaa/videosdk/BoyaaVoice$GetParams;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    iget-object v0, v0, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x54

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 360
    :goto_0
    const/4 v0, 0x0

    return-object v0

    .line 358
    :cond_0
    iget-object v0, p0, Lcom/boyaa/videosdk/BoyaaVoice$GetParams;->this$0:Lcom/boyaa/videosdk/BoyaaVoice;

    iget-object v0, v0, Lcom/boyaa/videosdk/BoyaaVoice;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x55

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0
.end method

.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lcom/boyaa/videosdk/BoyaaVoice$GetParams;->doInBackground([Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method
