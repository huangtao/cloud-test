.class public Lcom/boyaa/engine/made/AppEffect;
.super Ljava/lang/Object;
.source "AppEffect.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/engine/made/AppEffect$SoundItem;
    }
.end annotation


# static fields
.field public static sCustomID:I


# instance fields
.field private final INVAILD_ID:I

.field private final MAX_STREAMDS:I

.field private final SOUND_QUALITY:I

.field private mAutoPlayCustomIDArray:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field mContext:Landroid/content/Context;

.field private mCustomIDSoundItemMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/boyaa/engine/made/AppEffect$SoundItem;",
            ">;"
        }
    .end annotation
.end field

.field private mPathCustomIDMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mSoundPool:Landroid/media/SoundPool;

.field private mVolume:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    const/4 v0, 0x0

    sput v0, Lcom/boyaa/engine/made/AppEffect;->sCustomID:I

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x5

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const/4 v0, -0x1

    iput v0, p0, Lcom/boyaa/engine/made/AppEffect;->INVAILD_ID:I

    .line 19
    iput v3, p0, Lcom/boyaa/engine/made/AppEffect;->MAX_STREAMDS:I

    .line 20
    iput v3, p0, Lcom/boyaa/engine/made/AppEffect;->SOUND_QUALITY:I

    .line 36
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/boyaa/engine/made/AppEffect;->mVolume:F

    .line 41
    new-instance v0, Landroid/media/SoundPool;

    const/4 v1, 0x3

    const/4 v2, 0x0

    invoke-direct {v0, v3, v1, v2}, Landroid/media/SoundPool;-><init>(III)V

    iput-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mSoundPool:Landroid/media/SoundPool;

    .line 45
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mPathCustomIDMap:Ljava/util/Map;

    .line 46
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mCustomIDSoundItemMap:Ljava/util/Map;

    .line 47
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mAutoPlayCustomIDArray:Ljava/util/Set;

    .line 52
    invoke-virtual {p0}, Lcom/boyaa/engine/made/AppEffect;->setOnLoadCompleteListener()V

    .line 53
    return-void
.end method

.method static synthetic access$000(Lcom/boyaa/engine/made/AppEffect;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Lcom/boyaa/engine/made/AppEffect;

    .prologue
    .line 17
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mAutoPlayCustomIDArray:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic access$100(Lcom/boyaa/engine/made/AppEffect;I)Lcom/boyaa/engine/made/AppEffect$SoundItem;
    .locals 1
    .param p0, "x0"    # Lcom/boyaa/engine/made/AppEffect;
    .param p1, "x1"    # I

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lcom/boyaa/engine/made/AppEffect;->getItem(I)Lcom/boyaa/engine/made/AppEffect$SoundItem;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/boyaa/engine/made/AppEffect;)F
    .locals 1
    .param p0, "x0"    # Lcom/boyaa/engine/made/AppEffect;

    .prologue
    .line 17
    iget v0, p0, Lcom/boyaa/engine/made/AppEffect;->mVolume:F

    return v0
.end method

.method private getItem(I)Lcom/boyaa/engine/made/AppEffect$SoundItem;
    .locals 2
    .param p1, "customID"    # I

    .prologue
    .line 261
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mCustomIDSoundItemMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/boyaa/engine/made/AppEffect$SoundItem;

    return-object v0
.end method

.method private removeItem(I)V
    .locals 2
    .param p1, "customID"    # I

    .prologue
    .line 257
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mCustomIDSoundItemMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    return-void
.end method


# virtual methods
.method public getVolume()F
    .locals 1

    .prologue
    .line 221
    iget v0, p0, Lcom/boyaa/engine/made/AppEffect;->mVolume:F

    return v0
.end method

.method public pause(I)V
    .locals 3
    .param p1, "customID"    # I

    .prologue
    .line 207
    invoke-direct {p0, p1}, Lcom/boyaa/engine/made/AppEffect;->getItem(I)Lcom/boyaa/engine/made/AppEffect$SoundItem;

    move-result-object v0

    .line 208
    .local v0, "item":Lcom/boyaa/engine/made/AppEffect$SoundItem;
    if-eqz v0, :cond_0

    iget v1, v0, Lcom/boyaa/engine/made/AppEffect$SoundItem;->streamID:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 209
    iget-object v1, p0, Lcom/boyaa/engine/made/AppEffect;->mSoundPool:Landroid/media/SoundPool;

    iget v2, v0, Lcom/boyaa/engine/made/AppEffect$SoundItem;->streamID:I

    invoke-virtual {v1, v2}, Landroid/media/SoundPool;->pause(I)V

    .line 211
    :cond_0
    return-void
.end method

.method public pauseAll()V
    .locals 1

    .prologue
    .line 229
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Landroid/media/SoundPool;->autoPause()V

    .line 230
    return-void
.end method

.method public play(Ljava/lang/String;Z)I
    .locals 10
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "isLoop"    # Z

    .prologue
    const/4 v5, -0x1

    .line 136
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mPathCustomIDMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 137
    invoke-virtual {p0, p1}, Lcom/boyaa/engine/made/AppEffect;->preload(Ljava/lang/String;)I

    move-result v7

    .line 138
    .local v7, "customID":I
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mAutoPlayCustomIDArray:Ljava/util/Set;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 166
    .end local v7    # "customID":I
    :goto_0
    return v7

    .line 142
    :cond_0
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mPathCustomIDMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    .line 143
    .local v7, "customID":Ljava/lang/Integer;
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mCustomIDSoundItemMap:Ljava/util/Map;

    invoke-interface {v0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/boyaa/engine/made/AppEffect$SoundItem;

    .line 146
    .local v8, "item":Lcom/boyaa/engine/made/AppEffect$SoundItem;
    if-nez v8, :cond_1

    .line 147
    invoke-virtual {p0, p1}, Lcom/boyaa/engine/made/AppEffect;->preload(Ljava/lang/String;)I

    move-result v9

    .line 148
    .local v9, "newCustomID":I
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mAutoPlayCustomIDArray:Ljava/util/Set;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move v7, v9

    .line 149
    goto :goto_0

    .line 153
    .end local v9    # "newCustomID":I
    :cond_1
    iget v0, v8, Lcom/boyaa/engine/made/AppEffect$SoundItem;->soundID:I

    if-ne v0, v5, :cond_2

    .line 154
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mAutoPlayCustomIDArray:Ljava/util/Set;

    invoke-interface {v0, v7}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 166
    :goto_1
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    goto :goto_0

    .line 158
    :cond_2
    iget v0, v8, Lcom/boyaa/engine/made/AppEffect$SoundItem;->streamID:I

    if-eq v0, v5, :cond_3

    .line 159
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mSoundPool:Landroid/media/SoundPool;

    iget v1, v8, Lcom/boyaa/engine/made/AppEffect$SoundItem;->streamID:I

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->stop(I)V

    .line 161
    :cond_3
    if-eqz p2, :cond_4

    .line 162
    .local v5, "loop":I
    :goto_2
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mSoundPool:Landroid/media/SoundPool;

    iget v1, v8, Lcom/boyaa/engine/made/AppEffect$SoundItem;->soundID:I

    iget v2, p0, Lcom/boyaa/engine/made/AppEffect;->mVolume:F

    iget v3, p0, Lcom/boyaa/engine/made/AppEffect;->mVolume:F

    const/4 v4, 0x5

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-virtual/range {v0 .. v6}, Landroid/media/SoundPool;->play(IFFIIF)I

    move-result v0

    iput v0, v8, Lcom/boyaa/engine/made/AppEffect$SoundItem;->streamID:I

    goto :goto_1

    .line 161
    .end local v5    # "loop":I
    :cond_4
    const/4 v5, 0x0

    goto :goto_2
.end method

.method public preload(Ljava/lang/String;)I
    .locals 1
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 103
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/boyaa/engine/made/AppEffect;->preload(Ljava/lang/String;Z)I

    move-result v0

    return v0
.end method

.method public preload(Ljava/lang/String;Z)I
    .locals 7
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "autoPlay"    # Z

    .prologue
    .line 107
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEffect;->mPathCustomIDMap:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 108
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEffect;->mPathCustomIDMap:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 109
    .local v0, "customID":Ljava/lang/Integer;
    if-eqz p2, :cond_0

    .line 110
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEffect;->mAutoPlayCustomIDArray:Ljava/util/Set;

    invoke-interface {v3, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 113
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 132
    .end local v0    # "customID":Ljava/lang/Integer;
    :goto_0
    return v3

    .line 116
    :cond_1
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEffect;->mSoundPool:Landroid/media/SoundPool;

    if-nez v3, :cond_2

    .line 117
    new-instance v3, Landroid/media/SoundPool;

    const/4 v4, 0x5

    const/4 v5, 0x3

    const/4 v6, 0x0

    invoke-direct {v3, v4, v5, v6}, Landroid/media/SoundPool;-><init>(III)V

    iput-object v3, p0, Lcom/boyaa/engine/made/AppEffect;->mSoundPool:Landroid/media/SoundPool;

    .line 119
    invoke-virtual {p0}, Lcom/boyaa/engine/made/AppEffect;->setOnLoadCompleteListener()V

    .line 122
    :cond_2
    new-instance v1, Lcom/boyaa/engine/made/AppEffect$SoundItem;

    invoke-direct {v1, p0}, Lcom/boyaa/engine/made/AppEffect$SoundItem;-><init>(Lcom/boyaa/engine/made/AppEffect;)V

    .line 123
    .local v1, "item":Lcom/boyaa/engine/made/AppEffect$SoundItem;
    iput-object p1, v1, Lcom/boyaa/engine/made/AppEffect$SoundItem;->path:Ljava/lang/String;

    .line 124
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEffect;->mCustomIDSoundItemMap:Ljava/util/Map;

    iget v4, v1, Lcom/boyaa/engine/made/AppEffect$SoundItem;->customID:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEffect;->mPathCustomIDMap:Ljava/util/Map;

    iget v4, v1, Lcom/boyaa/engine/made/AppEffect$SoundItem;->customID:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, p1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEffect;->mSoundPool:Landroid/media/SoundPool;

    const/4 v4, 0x1

    invoke-virtual {v3, p1, v4}, Landroid/media/SoundPool;->load(Ljava/lang/String;I)I

    move-result v2

    .line 128
    .local v2, "soundID":I
    iput v2, v1, Lcom/boyaa/engine/made/AppEffect$SoundItem;->soundID:I

    .line 129
    if-eqz p2, :cond_3

    .line 130
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEffect;->mAutoPlayCustomIDArray:Ljava/util/Set;

    iget v4, v1, Lcom/boyaa/engine/made/AppEffect$SoundItem;->customID:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 132
    :cond_3
    iget v3, v1, Lcom/boyaa/engine/made/AppEffect$SoundItem;->customID:I

    goto :goto_0
.end method

.method public release()V
    .locals 1

    .prologue
    .line 247
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mSoundPool:Landroid/media/SoundPool;

    if-eqz v0, :cond_0

    .line 248
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Landroid/media/SoundPool;->release()V

    .line 249
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mSoundPool:Landroid/media/SoundPool;

    .line 250
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mPathCustomIDMap:Ljava/util/Map;

    .line 251
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mCustomIDSoundItemMap:Ljava/util/Map;

    .line 252
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mAutoPlayCustomIDArray:Ljava/util/Set;

    .line 254
    :cond_0
    return-void
.end method

.method public resume(I)V
    .locals 3
    .param p1, "customID"    # I

    .prologue
    .line 214
    invoke-direct {p0, p1}, Lcom/boyaa/engine/made/AppEffect;->getItem(I)Lcom/boyaa/engine/made/AppEffect$SoundItem;

    move-result-object v0

    .line 215
    .local v0, "item":Lcom/boyaa/engine/made/AppEffect$SoundItem;
    if-eqz v0, :cond_0

    iget v1, v0, Lcom/boyaa/engine/made/AppEffect$SoundItem;->streamID:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 216
    iget-object v1, p0, Lcom/boyaa/engine/made/AppEffect;->mSoundPool:Landroid/media/SoundPool;

    iget v2, v0, Lcom/boyaa/engine/made/AppEffect$SoundItem;->streamID:I

    invoke-virtual {v1, v2}, Landroid/media/SoundPool;->resume(I)V

    .line 218
    :cond_0
    return-void
.end method

.method public resumeAll()V
    .locals 1

    .prologue
    .line 233
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v0}, Landroid/media/SoundPool;->autoResume()V

    .line 234
    return-void
.end method

.method public setOnLoadCompleteListener()V
    .locals 2

    .prologue
    .line 57
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mSoundPool:Landroid/media/SoundPool;

    if-eqz v0, :cond_0

    .line 58
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEffect;->mSoundPool:Landroid/media/SoundPool;

    new-instance v1, Lcom/boyaa/engine/made/AppEffect$1;

    invoke-direct {v1, p0}, Lcom/boyaa/engine/made/AppEffect$1;-><init>(Lcom/boyaa/engine/made/AppEffect;)V

    invoke-virtual {v0, v1}, Landroid/media/SoundPool;->setOnLoadCompleteListener(Landroid/media/SoundPool$OnLoadCompleteListener;)V

    .line 84
    :cond_0
    return-void
.end method

.method public setVolume(F)V
    .locals 0
    .param p1, "volume"    # F

    .prologue
    .line 225
    iput p1, p0, Lcom/boyaa/engine/made/AppEffect;->mVolume:F

    .line 226
    return-void
.end method

.method public stop(I)V
    .locals 3
    .param p1, "customID"    # I

    .prologue
    .line 170
    invoke-direct {p0, p1}, Lcom/boyaa/engine/made/AppEffect;->getItem(I)Lcom/boyaa/engine/made/AppEffect$SoundItem;

    move-result-object v0

    .line 172
    .local v0, "item":Lcom/boyaa/engine/made/AppEffect$SoundItem;
    if-nez v0, :cond_0

    .line 177
    :goto_0
    return-void

    .line 175
    :cond_0
    iget-object v1, p0, Lcom/boyaa/engine/made/AppEffect;->mSoundPool:Landroid/media/SoundPool;

    iget v2, v0, Lcom/boyaa/engine/made/AppEffect$SoundItem;->streamID:I

    invoke-virtual {v1, v2}, Landroid/media/SoundPool;->stop(I)V

    .line 176
    const/4 v1, -0x1

    iput v1, v0, Lcom/boyaa/engine/made/AppEffect$SoundItem;->streamID:I

    goto :goto_0
.end method

.method public stopAll()V
    .locals 4

    .prologue
    .line 237
    iget-object v2, p0, Lcom/boyaa/engine/made/AppEffect;->mCustomIDSoundItemMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v1

    .line 238
    .local v1, "length":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 239
    iget-object v2, p0, Lcom/boyaa/engine/made/AppEffect;->mCustomIDSoundItemMap:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/boyaa/engine/made/AppEffect$SoundItem;

    iget v2, v2, Lcom/boyaa/engine/made/AppEffect$SoundItem;->customID:I

    invoke-virtual {p0, v2}, Lcom/boyaa/engine/made/AppEffect;->stop(I)V

    .line 238
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 241
    :cond_0
    return-void
.end method

.method public unload(I)V
    .locals 4
    .param p1, "customID"    # I

    .prologue
    .line 180
    invoke-direct {p0, p1}, Lcom/boyaa/engine/made/AppEffect;->getItem(I)Lcom/boyaa/engine/made/AppEffect$SoundItem;

    move-result-object v0

    .line 182
    .local v0, "item":Lcom/boyaa/engine/made/AppEffect$SoundItem;
    if-nez v0, :cond_0

    .line 195
    :goto_0
    return-void

    .line 186
    :cond_0
    invoke-direct {p0, p1}, Lcom/boyaa/engine/made/AppEffect;->removeItem(I)V

    .line 188
    iget v2, v0, Lcom/boyaa/engine/made/AppEffect$SoundItem;->streamID:I

    .line 189
    .local v2, "streamID":I
    iget v1, v0, Lcom/boyaa/engine/made/AppEffect$SoundItem;->soundID:I

    .line 191
    .local v1, "soundID":I
    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    .line 192
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEffect;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v3, v2}, Landroid/media/SoundPool;->stop(I)V

    .line 194
    :cond_1
    iget-object v3, p0, Lcom/boyaa/engine/made/AppEffect;->mSoundPool:Landroid/media/SoundPool;

    invoke-virtual {v3, v1}, Landroid/media/SoundPool;->unload(I)Z

    goto :goto_0
.end method

.method public unload(Ljava/lang/String;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 198
    const/4 v0, -0x1

    .line 199
    .local v0, "customID":I
    iget-object v1, p0, Lcom/boyaa/engine/made/AppEffect;->mPathCustomIDMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 200
    iget-object v1, p0, Lcom/boyaa/engine/made/AppEffect;->mPathCustomIDMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 203
    :cond_0
    invoke-virtual {p0, v0}, Lcom/boyaa/engine/made/AppEffect;->unload(I)V

    .line 204
    return-void
.end method
