.class public Lcom/boyaa/engine/made/AppMusic;
.super Ljava/lang/Object;
.source "AppMusic.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;
.implements Landroid/media/MediaPlayer$OnErrorListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "AppMusic"


# instance fields
.field private mCurrentPath:Ljava/lang/String;

.field private mIsPaused:Z

.field private mLeftVolume:F

.field private mListener:Landroid/media/MediaPlayer$OnCompletionListener;

.field private mMediaPlayer:Landroid/media/MediaPlayer;

.field private mRightVolume:F


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    invoke-direct {p0}, Lcom/boyaa/engine/made/AppMusic;->initData()V

    .line 30
    return-void
.end method

.method private createMediaplayerFromFile(Ljava/lang/String;)V
    .locals 6
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 64
    invoke-virtual {p0}, Lcom/boyaa/engine/made/AppMusic;->Release()V

    .line 65
    new-instance v3, Landroid/media/MediaPlayer;

    invoke-direct {v3}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v3, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 66
    iget-object v3, p0, Lcom/boyaa/engine/made/AppMusic;->mListener:Landroid/media/MediaPlayer$OnCompletionListener;

    if-eqz v3, :cond_0

    .line 67
    iget-object v3, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v4, p0, Lcom/boyaa/engine/made/AppMusic;->mListener:Landroid/media/MediaPlayer$OnCompletionListener;

    invoke-virtual {v3, v4}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 69
    :cond_0
    const/4 v1, 0x0

    .line 71
    .local v1, "fs":Ljava/io/FileInputStream;
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    .end local v1    # "fs":Ljava/io/FileInputStream;
    .local v2, "fs":Ljava/io/FileInputStream;
    :try_start_1
    iget-object v3, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v2}, Ljava/io/FileInputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;)V

    .line 73
    iget-object v3, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget v4, p0, Lcom/boyaa/engine/made/AppMusic;->mLeftVolume:F

    iget v5, p0, Lcom/boyaa/engine/made/AppMusic;->mRightVolume:F

    invoke-virtual {v3, v4, v5}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 74
    iget-object v3, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v3}, Landroid/media/MediaPlayer;->prepare()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 78
    if-eqz v2, :cond_1

    .line 80
    :try_start_2
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    :cond_1
    :goto_0
    move-object v1, v2

    .line 86
    .end local v2    # "fs":Ljava/io/FileInputStream;
    .restart local v1    # "fs":Ljava/io/FileInputStream;
    :cond_2
    :goto_1
    iput-object p1, p0, Lcom/boyaa/engine/made/AppMusic;->mCurrentPath:Ljava/lang/String;

    .line 87
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/boyaa/engine/made/AppMusic;->mIsPaused:Z

    .line 88
    return-void

    .line 75
    :catch_0
    move-exception v0

    .line 76
    .local v0, "e":Ljava/lang/Exception;
    :goto_2
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 78
    if-eqz v1, :cond_2

    .line 80
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 81
    :catch_1
    move-exception v0

    .line 82
    .local v0, "e":Ljava/io/IOException;
    const-string v3, "AppMusic"

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 78
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    :goto_3
    if-eqz v1, :cond_3

    .line 80
    :try_start_5
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 78
    :cond_3
    :goto_4
    throw v3

    .line 81
    :catch_2
    move-exception v0

    .line 82
    .restart local v0    # "e":Ljava/io/IOException;
    const-string v4, "AppMusic"

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    .line 81
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "fs":Ljava/io/FileInputStream;
    .restart local v2    # "fs":Ljava/io/FileInputStream;
    :catch_3
    move-exception v0

    .line 82
    .restart local v0    # "e":Ljava/io/IOException;
    const-string v3, "AppMusic"

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 78
    .end local v0    # "e":Ljava/io/IOException;
    :catchall_1
    move-exception v3

    move-object v1, v2

    .end local v2    # "fs":Ljava/io/FileInputStream;
    .restart local v1    # "fs":Ljava/io/FileInputStream;
    goto :goto_3

    .line 75
    .end local v1    # "fs":Ljava/io/FileInputStream;
    .restart local v2    # "fs":Ljava/io/FileInputStream;
    :catch_4
    move-exception v0

    move-object v1, v2

    .end local v2    # "fs":Ljava/io/FileInputStream;
    .restart local v1    # "fs":Ljava/io/FileInputStream;
    goto :goto_2
.end method

.method private initData()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    const/high16 v0, 0x3f000000    # 0.5f

    .line 33
    iput v0, p0, Lcom/boyaa/engine/made/AppMusic;->mLeftVolume:F

    .line 34
    iput v0, p0, Lcom/boyaa/engine/made/AppMusic;->mRightVolume:F

    .line 35
    iput-object v1, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 36
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/engine/made/AppMusic;->mIsPaused:Z

    .line 37
    iput-object v1, p0, Lcom/boyaa/engine/made/AppMusic;->mCurrentPath:Ljava/lang/String;

    .line 38
    return-void
.end method


# virtual methods
.method public Release()V
    .locals 0

    .prologue
    .line 60
    invoke-virtual {p0}, Lcom/boyaa/engine/made/AppMusic;->end()V

    .line 61
    return-void
.end method

.method public end()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 51
    iget-object v0, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 52
    iget-object v0, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 54
    :cond_0
    iput-object v1, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/engine/made/AppMusic;->mIsPaused:Z

    .line 56
    iput-object v1, p0, Lcom/boyaa/engine/made/AppMusic;->mCurrentPath:Ljava/lang/String;

    .line 57
    return-void
.end method

.method public getCurrentMusicPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/boyaa/engine/made/AppMusic;->mCurrentPath:Ljava/lang/String;

    return-object v0
.end method

.method getVolume()F
    .locals 2

    .prologue
    .line 180
    iget-object v0, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 181
    iget v0, p0, Lcom/boyaa/engine/made/AppMusic;->mLeftVolume:F

    iget v1, p0, Lcom/boyaa/engine/made/AppMusic;->mRightVolume:F

    add-float/2addr v0, v1

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    .line 183
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method isPlaying()Z
    .locals 1

    .prologue
    .line 175
    iget-object v0, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 1
    .param p1, "mp"    # Landroid/media/MediaPlayer;
    .param p2, "what"    # I
    .param p3, "extra"    # I

    .prologue
    .line 202
    const/4 v0, 0x0

    return v0
.end method

.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 0
    .param p1, "mp"    # Landroid/media/MediaPlayer;

    .prologue
    .line 197
    return-void
.end method

.method pause()V
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 149
    iget-object v0, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 150
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/boyaa/engine/made/AppMusic;->mIsPaused:Z

    .line 152
    :cond_0
    return-void
.end method

.method public pauseBackgroundMusic()V
    .locals 1

    .prologue
    .line 118
    iget-object v0, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 119
    iget-object v0, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 120
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/boyaa/engine/made/AppMusic;->mIsPaused:Z

    .line 122
    :cond_0
    return-void
.end method

.method play(Ljava/lang/String;Z)V
    .locals 3
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "isLoop"    # Z

    .prologue
    .line 92
    if-nez p1, :cond_1

    .line 111
    :cond_0
    :goto_0
    return-void

    .line 95
    :cond_1
    iget-object v1, p0, Lcom/boyaa/engine/made/AppMusic;->mCurrentPath:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 96
    invoke-virtual {p0}, Lcom/boyaa/engine/made/AppMusic;->Release()V

    .line 97
    invoke-direct {p0, p1}, Lcom/boyaa/engine/made/AppMusic;->createMediaplayerFromFile(Ljava/lang/String;)V

    .line 99
    :cond_2
    iget-object v1, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    .line 101
    :try_start_0
    iget-object v1, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1, p2}, Landroid/media/MediaPlayer;->setLooping(Z)V

    .line 102
    iget-boolean v1, p0, Lcom/boyaa/engine/made/AppMusic;->mIsPaused:Z

    if-nez v1, :cond_3

    .line 103
    iget-object v1, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 105
    :cond_3
    iget-object v1, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 106
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/boyaa/engine/made/AppMusic;->mIsPaused:Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 107
    :catch_0
    move-exception v0

    .line 108
    .local v0, "e":Ljava/lang/IllegalStateException;
    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->printStackTrace()V

    goto :goto_0
.end method

.method preload(Ljava/lang/String;)V
    .locals 0
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-virtual {p0}, Lcom/boyaa/engine/made/AppMusic;->Release()V

    .line 47
    invoke-direct {p0, p1}, Lcom/boyaa/engine/made/AppMusic;->createMediaplayerFromFile(Ljava/lang/String;)V

    .line 48
    return-void
.end method

.method resume()V
    .locals 1

    .prologue
    .line 156
    iget-boolean v0, p0, Lcom/boyaa/engine/made/AppMusic;->mIsPaused:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 157
    iget-object v0, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 158
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/engine/made/AppMusic;->mIsPaused:Z

    .line 160
    :cond_0
    return-void
.end method

.method public resumeBackgroundMusic()V
    .locals 1

    .prologue
    .line 125
    iget-boolean v0, p0, Lcom/boyaa/engine/made/AppMusic;->mIsPaused:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 126
    iget-object v0, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 127
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/boyaa/engine/made/AppMusic;->mIsPaused:Z

    .line 129
    :cond_0
    return-void
.end method

.method rewind()V
    .locals 3

    .prologue
    .line 163
    iget-object v1, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    .line 165
    :try_start_0
    iget-object v1, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 166
    iget-object v1, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 167
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/boyaa/engine/made/AppMusic;->mIsPaused:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 172
    :cond_0
    :goto_0
    return-void

    .line 168
    :catch_0
    move-exception v0

    .line 169
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public rewindBackgroundMusic()V
    .locals 3

    .prologue
    .line 132
    iget-object v1, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    .line 134
    :try_start_0
    iget-object v1, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 135
    iget-object v1, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    .line 136
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/boyaa/engine/made/AppMusic;->mIsPaused:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 141
    :cond_0
    :goto_0
    return-void

    .line 137
    :catch_0
    move-exception v0

    .line 138
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V
    .locals 0
    .param p1, "listener"    # Landroid/media/MediaPlayer$OnCompletionListener;

    .prologue
    .line 41
    iput-object p1, p0, Lcom/boyaa/engine/made/AppMusic;->mListener:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 42
    return-void
.end method

.method setVolume(F)V
    .locals 1
    .param p1, "volume"    # F

    .prologue
    .line 187
    iget-object v0, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 188
    iget-object v0, p0, Lcom/boyaa/engine/made/AppMusic;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1, p1}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 190
    :cond_0
    iput p1, p0, Lcom/boyaa/engine/made/AppMusic;->mLeftVolume:F

    .line 191
    iput p1, p0, Lcom/boyaa/engine/made/AppMusic;->mRightVolume:F

    .line 192
    return-void
.end method

.method stop(Z)V
    .locals 0
    .param p1, "doRelease"    # Z

    .prologue
    .line 144
    invoke-virtual {p0}, Lcom/boyaa/engine/made/AppMusic;->Release()V

    .line 145
    return-void
.end method

.method public stopBackgroundMusic()V
    .locals 0

    .prologue
    .line 114
    invoke-virtual {p0}, Lcom/boyaa/engine/made/AppMusic;->Release()V

    .line 115
    return-void
.end method
