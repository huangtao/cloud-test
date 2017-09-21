.class Lcom/boyaa/entity/videosdk/VideoSDKHelper$1;
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
    iput-object p1, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper$1;->this$0:Lcom/boyaa/entity/videosdk/VideoSDKHelper;

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 114
    iget-object v0, p0, Lcom/boyaa/entity/videosdk/VideoSDKHelper$1;->this$0:Lcom/boyaa/entity/videosdk/VideoSDKHelper;

    const-string v1, "cmd_microphone_operate_fail"

    # invokes: Lcom/boyaa/entity/videosdk/VideoSDKHelper;->sendVideoCmd(Ljava/lang/String;)V
    invoke-static {v0, v1}, Lcom/boyaa/entity/videosdk/VideoSDKHelper;->access$0(Lcom/boyaa/entity/videosdk/VideoSDKHelper;Ljava/lang/String;)V

    .line 115
    return-void
.end method
