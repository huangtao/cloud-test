.class Lcom/boyaa/entity/videosdk/VideoSDKHelper$VideoSDKHandler;
.super Landroid/os/Handler;
.source "VideoSDKHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/entity/videosdk/VideoSDKHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "VideoSDKHandler"
.end annotation


# instance fields
.field private final mHelper:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/boyaa/entity/videosdk/VideoSDKHelper;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/boyaa/entity/videosdk/VideoSDKHelper;)V
    .locals 1
    .param p1, "helper"    # Lcom/boyaa/entity/videosdk/VideoSDKHelper;

    .prologue
    .line 252
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 253
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper$VideoSDKHandler;->mHelper:Ljava/lang/ref/WeakReference;

    .line 254
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 258
    iget-object v1, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper$VideoSDKHandler;->mHelper:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/boyaa/entity/videosdk/VideoSDKHelper;

    .line 260
    .local v0, "helper":Lcom/boyaa/entity/videosdk/VideoSDKHelper;
    if-eqz v0, :cond_0

    .line 261
    invoke-virtual {v0, p1}, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->handleMessage(Landroid/os/Message;)V

    .line 263
    :cond_0
    return-void
.end method
