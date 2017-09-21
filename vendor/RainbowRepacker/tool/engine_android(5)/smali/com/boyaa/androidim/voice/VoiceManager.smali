.class public Lcom/boyaa/androidim/voice/VoiceManager;
.super Ljava/lang/Object;
.source "VoiceManager.java"


# static fields
.field private static mInstance:Lcom/boyaa/androidim/voice/VoiceManager;

.field private static mLock:[B


# instance fields
.field private mVoicePlayService:Lcom/boyaa/androidim/voice/VoicePlayService;

.field private mVoiceService:Lcom/boyaa/androidim/voice/VoiceService;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 11
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/boyaa/androidim/voice/VoiceManager;->mLock:[B

    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    invoke-direct {p0}, Lcom/boyaa/androidim/voice/VoiceManager;->init()V

    .line 28
    return-void
.end method

.method public static getInstance()Lcom/boyaa/androidim/voice/VoiceManager;
    .locals 2

    .prologue
    .line 18
    sget-object v1, Lcom/boyaa/androidim/voice/VoiceManager;->mLock:[B

    monitor-enter v1

    .line 19
    :try_start_0
    sget-object v0, Lcom/boyaa/androidim/voice/VoiceManager;->mInstance:Lcom/boyaa/androidim/voice/VoiceManager;

    if-nez v0, :cond_0

    .line 20
    new-instance v0, Lcom/boyaa/androidim/voice/VoiceManager;

    invoke-direct {v0}, Lcom/boyaa/androidim/voice/VoiceManager;-><init>()V

    sput-object v0, Lcom/boyaa/androidim/voice/VoiceManager;->mInstance:Lcom/boyaa/androidim/voice/VoiceManager;

    .line 18
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    sget-object v0, Lcom/boyaa/androidim/voice/VoiceManager;->mInstance:Lcom/boyaa/androidim/voice/VoiceManager;

    return-object v0

    .line 18
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private init()V
    .locals 1

    .prologue
    .line 31
    new-instance v0, Lcom/boyaa/androidim/voice/VoiceService;

    invoke-direct {v0}, Lcom/boyaa/androidim/voice/VoiceService;-><init>()V

    iput-object v0, p0, Lcom/boyaa/androidim/voice/VoiceManager;->mVoiceService:Lcom/boyaa/androidim/voice/VoiceService;

    .line 32
    new-instance v0, Lcom/boyaa/androidim/voice/VoicePlayService;

    invoke-direct {v0}, Lcom/boyaa/androidim/voice/VoicePlayService;-><init>()V

    iput-object v0, p0, Lcom/boyaa/androidim/voice/VoiceManager;->mVoicePlayService:Lcom/boyaa/androidim/voice/VoicePlayService;

    .line 33
    return-void
.end method


# virtual methods
.method public playAudio(Ljava/lang/String;Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;)V
    .locals 4
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "listener"    # Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;

    .prologue
    .line 82
    new-instance v0, Lcom/boyaa/androidim/voice/VoiceBeanPlay;

    invoke-direct {v0, p1, p2}, Lcom/boyaa/androidim/voice/VoiceBeanPlay;-><init>(Ljava/lang/String;Lcom/boyaa/androidim/voice/VoicePlayCompletionListener;)V

    .line 83
    .local v0, "bean":Lcom/boyaa/androidim/voice/VoiceBeanPlay;
    iget-object v3, p0, Lcom/boyaa/androidim/voice/VoiceManager;->mVoicePlayService:Lcom/boyaa/androidim/voice/VoicePlayService;

    invoke-virtual {v3}, Lcom/boyaa/androidim/voice/VoicePlayService;->getVoiceHandler()Landroid/os/Handler;

    move-result-object v1

    .line 84
    .local v1, "handler":Landroid/os/Handler;
    const/4 v3, 0x3

    invoke-virtual {v1, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    .line 85
    .local v2, "msg":Landroid/os/Message;
    iput-object v0, v2, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 86
    invoke-virtual {v2}, Landroid/os/Message;->sendToTarget()V

    .line 87
    return-void
.end method

.method public release()V
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoiceManager;->mVoiceService:Lcom/boyaa/androidim/voice/VoiceService;

    if-eqz v0, :cond_0

    .line 102
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoiceManager;->mVoiceService:Lcom/boyaa/androidim/voice/VoiceService;

    invoke-virtual {v0}, Lcom/boyaa/androidim/voice/VoiceService;->release()V

    .line 105
    :cond_0
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoiceManager;->mVoicePlayService:Lcom/boyaa/androidim/voice/VoicePlayService;

    if-eqz v0, :cond_1

    .line 106
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoiceManager;->mVoicePlayService:Lcom/boyaa/androidim/voice/VoicePlayService;

    invoke-virtual {v0}, Lcom/boyaa/androidim/voice/VoicePlayService;->release()V

    .line 111
    :cond_1
    return-void
.end method

.method public startRecord(Lcom/boyaa/androidim/voice/RecordOnCompleleListener;I)V
    .locals 3
    .param p1, "listener"    # Lcom/boyaa/androidim/voice/RecordOnCompleleListener;
    .param p2, "type"    # I

    .prologue
    .line 43
    iget-object v2, p0, Lcom/boyaa/androidim/voice/VoiceManager;->mVoiceService:Lcom/boyaa/androidim/voice/VoiceService;

    invoke-virtual {v2}, Lcom/boyaa/androidim/voice/VoiceService;->getVoiceHandler()Landroid/os/Handler;

    move-result-object v0

    .line 44
    .local v0, "handler":Landroid/os/Handler;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    .line 45
    .local v1, "msg":Landroid/os/Message;
    iput p2, v1, Landroid/os/Message;->arg1:I

    .line 46
    iput-object p1, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 47
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    .line 49
    return-void
.end method

.method public stopAudio()V
    .locals 2

    .prologue
    .line 93
    iget-object v1, p0, Lcom/boyaa/androidim/voice/VoiceManager;->mVoicePlayService:Lcom/boyaa/androidim/voice/VoicePlayService;

    invoke-virtual {v1}, Lcom/boyaa/androidim/voice/VoicePlayService;->getVoiceHandler()Landroid/os/Handler;

    move-result-object v0

    .line 94
    .local v0, "handler":Landroid/os/Handler;
    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 95
    return-void
.end method

.method public stopRecord(Lcom/boyaa/androidim/voice/RecordOnCompleleListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/boyaa/androidim/voice/RecordOnCompleleListener;

    .prologue
    .line 68
    iget-object v0, p0, Lcom/boyaa/androidim/voice/VoiceManager;->mVoiceService:Lcom/boyaa/androidim/voice/VoiceService;

    invoke-virtual {v0, p1}, Lcom/boyaa/androidim/voice/VoiceService;->stopRecord(Lcom/boyaa/androidim/voice/RecordOnCompleleListener;)V

    .line 69
    return-void
.end method
