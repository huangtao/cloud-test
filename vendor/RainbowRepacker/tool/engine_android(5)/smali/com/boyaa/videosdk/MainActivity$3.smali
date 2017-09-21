.class Lcom/boyaa/videosdk/MainActivity$3;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/videosdk/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/videosdk/MainActivity;


# direct methods
.method constructor <init>(Lcom/boyaa/videosdk/MainActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/videosdk/MainActivity$3;->this$0:Lcom/boyaa/videosdk/MainActivity;

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "arg0"    # Landroid/view/View;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/boyaa/videosdk/MainActivity$3;->this$0:Lcom/boyaa/videosdk/MainActivity;

    iget-object v0, v0, Lcom/boyaa/videosdk/MainActivity;->mLayoutVideo:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 66
    invoke-static {}, Lcom/boyaa/videosdk/BoyaaVoice;->getInstance()Lcom/boyaa/videosdk/BoyaaVoice;

    move-result-object v0

    invoke-virtual {v0}, Lcom/boyaa/videosdk/BoyaaVoice;->SDKlogout()V

    .line 67
    return-void
.end method
