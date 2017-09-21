.class Lcom/boyaa/androidim/api/IMSDK_Interface$PlayListener;
.super Ljava/lang/Object;
.source "IMSDK_Interface.java"

# interfaces
.implements Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/androidim/api/IMSDK_Interface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PlayListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/androidim/api/IMSDK_Interface;


# direct methods
.method constructor <init>(Lcom/boyaa/androidim/api/IMSDK_Interface;)V
    .locals 0

    .prologue
    .line 242
    iput-object p1, p0, Lcom/boyaa/androidim/api/IMSDK_Interface$PlayListener;->this$0:Lcom/boyaa/androidim/api/IMSDK_Interface;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public playCompletion()V
    .locals 2

    .prologue
    .line 248
    iget-object v0, p0, Lcom/boyaa/androidim/api/IMSDK_Interface$PlayListener;->this$0:Lcom/boyaa/androidim/api/IMSDK_Interface;

    iget-object v0, v0, Lcom/boyaa/androidim/api/IMSDK_Interface;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 249
    return-void
.end method
