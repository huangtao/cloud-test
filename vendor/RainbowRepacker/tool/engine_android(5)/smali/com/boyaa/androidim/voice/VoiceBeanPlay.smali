.class public Lcom/boyaa/androidim/voice/VoiceBeanPlay;
.super Ljava/lang/Object;
.source "VoiceBeanPlay.java"


# instance fields
.field public listener:Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;

.field public path:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;)V
    .locals 0
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "listener"    # Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput-object p1, p0, Lcom/boyaa/androidim/voice/VoiceBeanPlay;->path:Ljava/lang/String;

    .line 10
    iput-object p2, p0, Lcom/boyaa/androidim/voice/VoiceBeanPlay;->listener:Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;

    .line 11
    return-void
.end method
