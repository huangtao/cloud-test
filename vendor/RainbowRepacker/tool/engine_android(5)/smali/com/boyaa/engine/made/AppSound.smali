.class public Lcom/boyaa/engine/made/AppSound;
.super Ljava/lang/Object;
.source "AppSound.java"


# static fields
.field static sAppEffect:Lcom/boyaa/engine/made/AppEffect;

.field static sAppMusic:Lcom/boyaa/engine/made/AppMusic;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 9
    new-instance v0, Lcom/boyaa/engine/made/AppMusic;

    invoke-direct {v0}, Lcom/boyaa/engine/made/AppMusic;-><init>()V

    sput-object v0, Lcom/boyaa/engine/made/AppSound;->sAppMusic:Lcom/boyaa/engine/made/AppMusic;

    .line 10
    new-instance v0, Lcom/boyaa/engine/made/AppEffect;

    invoke-direct {v0}, Lcom/boyaa/engine/made/AppEffect;-><init>()V

    sput-object v0, Lcom/boyaa/engine/made/AppSound;->sAppEffect:Lcom/boyaa/engine/made/AppEffect;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static end()V
    .locals 2

    .prologue
    .line 177
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppMusic:Lcom/boyaa/engine/made/AppMusic;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/made/AppMusic;->stop(Z)V

    .line 178
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppEffect:Lcom/boyaa/engine/made/AppEffect;

    invoke-virtual {v0}, Lcom/boyaa/engine/made/AppEffect;->release()V

    .line 179
    return-void
.end method

.method public static getCurrentMusicPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 185
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppMusic:Lcom/boyaa/engine/made/AppMusic;

    invoke-virtual {v0}, Lcom/boyaa/engine/made/AppMusic;->getCurrentMusicPath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getEffectVolume()F
    .locals 1

    .prologue
    .line 163
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppEffect:Lcom/boyaa/engine/made/AppEffect;

    invoke-virtual {v0}, Lcom/boyaa/engine/made/AppEffect;->getVolume()F

    move-result v0

    return v0
.end method

.method public static getMusicVolume()F
    .locals 1

    .prologue
    .line 75
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppMusic:Lcom/boyaa/engine/made/AppMusic;

    invoke-virtual {v0}, Lcom/boyaa/engine/made/AppMusic;->getVolume()F

    move-result v0

    return v0
.end method

.method public static isMusicPlaying()Z
    .locals 1

    .prologue
    .line 68
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppMusic:Lcom/boyaa/engine/made/AppMusic;

    invoke-virtual {v0}, Lcom/boyaa/engine/made/AppMusic;->isPlaying()Z

    move-result v0

    return v0
.end method

.method public static pauseAllEffects()V
    .locals 1

    .prologue
    .line 129
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppEffect:Lcom/boyaa/engine/made/AppEffect;

    invoke-virtual {v0}, Lcom/boyaa/engine/made/AppEffect;->pauseAll()V

    .line 130
    return-void
.end method

.method public static pauseEffect(I)V
    .locals 1
    .param p0, "id"    # I

    .prologue
    .line 115
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppEffect:Lcom/boyaa/engine/made/AppEffect;

    invoke-virtual {v0, p0}, Lcom/boyaa/engine/made/AppEffect;->pause(I)V

    .line 116
    return-void
.end method

.method public static pauseMusic()V
    .locals 1

    .prologue
    .line 46
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppMusic:Lcom/boyaa/engine/made/AppMusic;

    invoke-virtual {v0}, Lcom/boyaa/engine/made/AppMusic;->pause()V

    .line 47
    return-void
.end method

.method public static playEffect(Ljava/lang/String;Z)I
    .locals 1
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "isLoop"    # Z

    .prologue
    .line 100
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppEffect:Lcom/boyaa/engine/made/AppEffect;

    invoke-virtual {v0, p0, p1}, Lcom/boyaa/engine/made/AppEffect;->play(Ljava/lang/String;Z)I

    move-result v0

    return v0
.end method

.method public static playMusic(Ljava/lang/String;Z)V
    .locals 1
    .param p0, "path"    # Ljava/lang/String;
    .param p1, "isLoop"    # Z

    .prologue
    .line 26
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppMusic:Lcom/boyaa/engine/made/AppMusic;

    invoke-virtual {v0, p0, p1}, Lcom/boyaa/engine/made/AppMusic;->play(Ljava/lang/String;Z)V

    .line 27
    return-void
.end method

.method public static preloadEffect(Ljava/lang/String;)V
    .locals 1
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 91
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppEffect:Lcom/boyaa/engine/made/AppEffect;

    invoke-virtual {v0, p0}, Lcom/boyaa/engine/made/AppEffect;->preload(Ljava/lang/String;)I

    .line 92
    return-void
.end method

.method public static preloadMusic(Ljava/lang/String;)V
    .locals 1
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 17
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppMusic:Lcom/boyaa/engine/made/AppMusic;

    invoke-virtual {v0, p0}, Lcom/boyaa/engine/made/AppMusic;->preload(Ljava/lang/String;)V

    .line 18
    return-void
.end method

.method public static resumeAllEffects()V
    .locals 1

    .prologue
    .line 135
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppEffect:Lcom/boyaa/engine/made/AppEffect;

    invoke-virtual {v0}, Lcom/boyaa/engine/made/AppEffect;->resumeAll()V

    .line 136
    return-void
.end method

.method public static resumeEffect(I)V
    .locals 1
    .param p0, "id"    # I

    .prologue
    .line 122
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppEffect:Lcom/boyaa/engine/made/AppEffect;

    invoke-virtual {v0, p0}, Lcom/boyaa/engine/made/AppEffect;->resume(I)V

    .line 123
    return-void
.end method

.method public static resumeMusic()V
    .locals 1

    .prologue
    .line 53
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppMusic:Lcom/boyaa/engine/made/AppMusic;

    invoke-virtual {v0}, Lcom/boyaa/engine/made/AppMusic;->resume()V

    .line 54
    return-void
.end method

.method public static rewindMusic()V
    .locals 1

    .prologue
    .line 60
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppMusic:Lcom/boyaa/engine/made/AppMusic;

    invoke-virtual {v0}, Lcom/boyaa/engine/made/AppMusic;->rewind()V

    .line 61
    return-void
.end method

.method public static setEffectVolume(F)V
    .locals 1
    .param p0, "volume"    # F

    .prologue
    .line 170
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppEffect:Lcom/boyaa/engine/made/AppEffect;

    invoke-virtual {v0, p0}, Lcom/boyaa/engine/made/AppEffect;->setVolume(F)V

    .line 171
    return-void
.end method

.method public static setMusicVolume(F)V
    .locals 1
    .param p0, "volume"    # F

    .prologue
    .line 83
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppMusic:Lcom/boyaa/engine/made/AppMusic;

    invoke-virtual {v0, p0}, Lcom/boyaa/engine/made/AppMusic;->setVolume(F)V

    .line 84
    return-void
.end method

.method public static setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V
    .locals 1
    .param p0, "listener"    # Landroid/media/MediaPlayer$OnCompletionListener;

    .prologue
    .line 31
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppMusic:Lcom/boyaa/engine/made/AppMusic;

    invoke-virtual {v0, p0}, Lcom/boyaa/engine/made/AppMusic;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 32
    return-void
.end method

.method public static stopAllEffect()V
    .locals 1

    .prologue
    .line 141
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppEffect:Lcom/boyaa/engine/made/AppEffect;

    invoke-virtual {v0}, Lcom/boyaa/engine/made/AppEffect;->stopAll()V

    .line 142
    return-void
.end method

.method public static stopEffect(I)V
    .locals 1
    .param p0, "id"    # I

    .prologue
    .line 108
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppEffect:Lcom/boyaa/engine/made/AppEffect;

    invoke-virtual {v0, p0}, Lcom/boyaa/engine/made/AppEffect;->stop(I)V

    .line 109
    return-void
.end method

.method public static stopMusic(Z)V
    .locals 1
    .param p0, "doRelease"    # Z

    .prologue
    .line 39
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppMusic:Lcom/boyaa/engine/made/AppMusic;

    invoke-virtual {v0, p0}, Lcom/boyaa/engine/made/AppMusic;->stop(Z)V

    .line 40
    return-void
.end method

.method public static unloadEffect(I)V
    .locals 1
    .param p0, "id"    # I

    .prologue
    .line 148
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppEffect:Lcom/boyaa/engine/made/AppEffect;

    invoke-virtual {v0, p0}, Lcom/boyaa/engine/made/AppEffect;->unload(I)V

    .line 149
    return-void
.end method

.method public static unloadEffect(Ljava/lang/String;)V
    .locals 1
    .param p0, "path"    # Ljava/lang/String;

    .prologue
    .line 155
    sget-object v0, Lcom/boyaa/engine/made/AppSound;->sAppEffect:Lcom/boyaa/engine/made/AppEffect;

    invoke-virtual {v0, p0}, Lcom/boyaa/engine/made/AppEffect;->unload(Ljava/lang/String;)V

    .line 156
    return-void
.end method
