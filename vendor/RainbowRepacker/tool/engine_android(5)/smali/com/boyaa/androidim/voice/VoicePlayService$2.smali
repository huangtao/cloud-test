.class Lcom/boyaa/androidim/voice/VoicePlayService$2;
.super Ljava/lang/Object;
.source "VoicePlayService.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/androidim/voice/VoicePlayService;->playAudio(Ljava/lang/String;Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/androidim/voice/VoicePlayService;

.field private final synthetic val$listener:Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;


# direct methods
.method constructor <init>(Lcom/boyaa/androidim/voice/VoicePlayService;Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/androidim/voice/VoicePlayService$2;->this$0:Lcom/boyaa/androidim/voice/VoicePlayService;

    iput-object p2, p0, Lcom/boyaa/androidim/voice/VoicePlayService$2;->val$listener:Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 2
    .param p1, "mp"    # Landroid/media/MediaPlayer;

    .prologue
    .line 73
    const-string v0, "VoicePlayService"

    const-string v1, "\u64ad\u653e\u5b8c\u6bd5"

    invoke-static {v0, v1}, Lcom/boyaa/androidim/utils/LogUtils;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->stop()V

    .line 75
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->reset()V

    .line 76
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoicePlayService$2;->this$0:Lcom/boyaa/androidim/voice/VoicePlayService;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/boyaa/androidim/voice/VoicePlayService;->access$2(Lcom/boyaa/androidim/voice/VoicePlayService;Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;)V

    .line 77
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoicePlayService$2;->val$listener:Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;

    if-eqz v0, :cond_0

    .line 78
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoicePlayService$2;->val$listener:Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;

    invoke-interface {v0}, Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;->playCompletion()V

    .line 81
    :cond_0
    const/4 v0, 0x0

    sput-boolean v0, Lcom/boyaa/androidim/utils/Constants;->stopPlay:Z

    .line 82
    return-void
.end method
