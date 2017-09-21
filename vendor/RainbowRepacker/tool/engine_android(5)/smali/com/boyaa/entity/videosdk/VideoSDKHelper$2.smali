.class Lcom/boyaa/entity/videosdk/VideoSDKHelper$2;
.super Ljava/lang/Object;
.source "VideoSDKHelper.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/entity/videosdk/VideoSDKHelper;->showDialog(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/entity/videosdk/VideoSDKHelper;


# direct methods
.method constructor <init>(Lcom/boyaa/entity/videosdk/VideoSDKHelper;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper$2;->this$0:Lcom/boyaa/entity/videosdk/VideoSDKHelper;

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 123
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/boyaa/videosdk/BoyaaVoice;->setAudioControlInfo(Z)V

    .line 124
    return-void
.end method
