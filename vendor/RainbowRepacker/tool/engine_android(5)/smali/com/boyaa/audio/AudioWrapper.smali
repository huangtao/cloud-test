.class public Lcom/boyaa/audio/AudioWrapper;
.super Ljava/lang/Object;
.source "AudioWrapper.java"


# static fields
.field private static instanceAudioWrapper:Lcom/boyaa/audio/AudioWrapper;


# instance fields
.field private audioRecorder:Lcom/boyaa/audio/AudioRecorder;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    return-void
.end method

.method public static getInstance()Lcom/boyaa/audio/AudioWrapper;
    .locals 1

    .prologue
    .line 13
    sget-object v0, Lcom/boyaa/audio/AudioWrapper;->instanceAudioWrapper:Lcom/boyaa/audio/AudioWrapper;

    if-nez v0, :cond_0

    .line 14
    new-instance v0, Lcom/boyaa/audio/AudioWrapper;

    invoke-direct {v0}, Lcom/boyaa/audio/AudioWrapper;-><init>()V

    sput-object v0, Lcom/boyaa/audio/AudioWrapper;->instanceAudioWrapper:Lcom/boyaa/audio/AudioWrapper;

    .line 16
    :cond_0
    sget-object v0, Lcom/boyaa/audio/AudioWrapper;->instanceAudioWrapper:Lcom/boyaa/audio/AudioWrapper;

    return-object v0
.end method


# virtual methods
.method public startRecord()V
    .locals 1

    .prologue
    .line 20
    iget-object v0, p0, Lcom/boyaa/audio/AudioWrapper;->audioRecorder:Lcom/boyaa/audio/AudioRecorder;

    if-nez v0, :cond_0

    .line 21
    new-instance v0, Lcom/boyaa/audio/AudioRecorder;

    invoke-direct {v0}, Lcom/boyaa/audio/AudioRecorder;-><init>()V

    iput-object v0, p0, Lcom/boyaa/audio/AudioWrapper;->audioRecorder:Lcom/boyaa/audio/AudioRecorder;

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/boyaa/audio/AudioWrapper;->audioRecorder:Lcom/boyaa/audio/AudioRecorder;

    invoke-virtual {v0}, Lcom/boyaa/audio/AudioRecorder;->startRecording()V

    .line 24
    return-void
.end method

.method public stopRecord()V
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, Lcom/boyaa/audio/AudioWrapper;->audioRecorder:Lcom/boyaa/audio/AudioRecorder;

    if-eqz v0, :cond_0

    .line 28
    iget-object v0, p0, Lcom/boyaa/audio/AudioWrapper;->audioRecorder:Lcom/boyaa/audio/AudioRecorder;

    invoke-virtual {v0}, Lcom/boyaa/audio/AudioRecorder;->stopRecording()V

    .line 29
    :cond_0
    return-void
.end method
