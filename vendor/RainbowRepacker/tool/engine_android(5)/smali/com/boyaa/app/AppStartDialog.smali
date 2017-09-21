.class public Lcom/boyaa/app/AppStartDialog;
.super Landroid/app/AlertDialog;
.source "AppStartDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/app/AppStartDialog$AppLoadingListener;
    }
.end annotation


# instance fields
.field private activity:Landroid/app/Activity;

.field private isLuaLoaded:Z

.field private isPlayingOver:Z

.field private isVideo:Z

.field private isVideoPlaying:Z

.field private listener:Lcom/boyaa/app/AppStartDialog$AppLoadingListener;

.field private mImageViewPicture:Landroid/widget/ImageView;

.field private mLoadingDialog:Lcom/boyaa/widget/LoadingDialog;

.field private mVideoView:Lcom/boyaa/widget/CustomVideoView;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 2
    .param p1, "context"    # Landroid/app/Activity;

    .prologue
    const/4 v1, 0x0

    .line 38
    const v0, 0x7f080002

    invoke-direct {p0, p1, v0}, Landroid/app/AlertDialog;-><init>(Landroid/content/Context;I)V

    .line 32
    iput-boolean v1, p0, Lcom/boyaa/app/AppStartDialog;->isVideoPlaying:Z

    .line 33
    iput-boolean v1, p0, Lcom/boyaa/app/AppStartDialog;->isVideo:Z

    .line 34
    iput-boolean v1, p0, Lcom/boyaa/app/AppStartDialog;->isLuaLoaded:Z

    .line 35
    iput-boolean v1, p0, Lcom/boyaa/app/AppStartDialog;->isPlayingOver:Z

    .line 39
    iput-object p1, p0, Lcom/boyaa/app/AppStartDialog;->activity:Landroid/app/Activity;

    .line 40
    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/app/AppStartDialog;Z)V
    .locals 0

    .prologue
    .line 32
    iput-boolean p1, p0, Lcom/boyaa/app/AppStartDialog;->isVideoPlaying:Z

    return-void
.end method

.method static synthetic access$1(Lcom/boyaa/app/AppStartDialog;)V
    .locals 0

    .prologue
    .line 111
    invoke-direct {p0}, Lcom/boyaa/app/AppStartDialog;->onVideoOrImageShowingFinished()V

    return-void
.end method

.method static synthetic access$2(Lcom/boyaa/app/AppStartDialog;Z)V
    .locals 0

    .prologue
    .line 35
    iput-boolean p1, p0, Lcom/boyaa/app/AppStartDialog;->isPlayingOver:Z

    return-void
.end method

.method static synthetic access$3(Lcom/boyaa/app/AppStartDialog;)Z
    .locals 1

    .prologue
    .line 34
    iget-boolean v0, p0, Lcom/boyaa/app/AppStartDialog;->isLuaLoaded:Z

    return v0
.end method

.method static synthetic access$4(Lcom/boyaa/app/AppStartDialog;)Lcom/boyaa/app/AppStartDialog$AppLoadingListener;
    .locals 1

    .prologue
    .line 240
    iget-object v0, p0, Lcom/boyaa/app/AppStartDialog;->listener:Lcom/boyaa/app/AppStartDialog$AppLoadingListener;

    return-object v0
.end method

.method static synthetic access$5(Lcom/boyaa/app/AppStartDialog;)Landroid/app/Activity;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/boyaa/app/AppStartDialog;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$6(Lcom/boyaa/app/AppStartDialog;)V
    .locals 0

    .prologue
    .line 194
    invoke-direct {p0}, Lcom/boyaa/app/AppStartDialog;->showLoading()V

    return-void
.end method

.method private closeLoadingDialog()V
    .locals 1

    .prologue
    .line 209
    :try_start_0
    iget-object v0, p0, Lcom/boyaa/app/AppStartDialog;->mLoadingDialog:Lcom/boyaa/widget/LoadingDialog;

    if-eqz v0, :cond_1

    .line 210
    iget-object v0, p0, Lcom/boyaa/app/AppStartDialog;->mLoadingDialog:Lcom/boyaa/widget/LoadingDialog;

    invoke-virtual {v0}, Lcom/boyaa/widget/LoadingDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 211
    iget-object v0, p0, Lcom/boyaa/app/AppStartDialog;->mLoadingDialog:Lcom/boyaa/widget/LoadingDialog;

    invoke-virtual {v0}, Lcom/boyaa/widget/LoadingDialog;->dismiss()V

    .line 213
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/app/AppStartDialog;->mLoadingDialog:Lcom/boyaa/widget/LoadingDialog;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 217
    :cond_1
    :goto_0
    return-void

    .line 215
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method private onVideoOrImageShowingFinished()V
    .locals 3

    .prologue
    .line 112
    invoke-virtual {p0}, Lcom/boyaa/app/AppStartDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    const/high16 v2, 0x7f040000

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 113
    .local v0, "overAnimation":Landroid/view/animation/Animation;
    new-instance v1, Lcom/boyaa/app/AppStartDialog$3;

    invoke-direct {v1, p0}, Lcom/boyaa/app/AppStartDialog$3;-><init>(Lcom/boyaa/app/AppStartDialog;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 139
    iget-boolean v1, p0, Lcom/boyaa/app/AppStartDialog;->isVideo:Z

    if-eqz v1, :cond_0

    .line 140
    iget-object v1, p0, Lcom/boyaa/app/AppStartDialog;->mVideoView:Lcom/boyaa/widget/CustomVideoView;

    invoke-virtual {v1, v0}, Lcom/boyaa/widget/CustomVideoView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 144
    :goto_0
    return-void

    .line 142
    :cond_0
    iget-object v1, p0, Lcom/boyaa/app/AppStartDialog;->mImageViewPicture:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0
.end method

.method private playVedio(I)V
    .locals 3
    .param p1, "resId"    # I

    .prologue
    const/4 v1, 0x1

    .line 65
    iput-boolean v1, p0, Lcom/boyaa/app/AppStartDialog;->isVideo:Z

    .line 66
    iput-boolean v1, p0, Lcom/boyaa/app/AppStartDialog;->isVideoPlaying:Z

    .line 68
    iget-object v1, p0, Lcom/boyaa/app/AppStartDialog;->mVideoView:Lcom/boyaa/widget/CustomVideoView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/boyaa/widget/CustomVideoView;->setVisibility(I)V

    .line 69
    iget-object v1, p0, Lcom/boyaa/app/AppStartDialog;->mVideoView:Lcom/boyaa/widget/CustomVideoView;

    new-instance v2, Lcom/boyaa/app/AppStartDialog$1;

    invoke-direct {v2, p0}, Lcom/boyaa/app/AppStartDialog$1;-><init>(Lcom/boyaa/app/AppStartDialog;)V

    invoke-virtual {v1, v2}, Lcom/boyaa/widget/CustomVideoView;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 77
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "android.resource://"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/boyaa/app/AppStartDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 78
    .local v0, "path":Ljava/lang/String;
    iget-object v1, p0, Lcom/boyaa/app/AppStartDialog;->mVideoView:Lcom/boyaa/widget/CustomVideoView;

    invoke-virtual {v1, v0}, Lcom/boyaa/widget/CustomVideoView;->setVideoPath(Ljava/lang/String;)V

    .line 79
    iget-object v1, p0, Lcom/boyaa/app/AppStartDialog;->mVideoView:Lcom/boyaa/widget/CustomVideoView;

    invoke-virtual {v1}, Lcom/boyaa/widget/CustomVideoView;->start()V

    .line 80
    return-void
.end method

.method private showLoading()V
    .locals 4

    .prologue
    .line 195
    iget-object v2, p0, Lcom/boyaa/app/AppStartDialog;->mLoadingDialog:Lcom/boyaa/widget/LoadingDialog;

    if-nez v2, :cond_0

    .line 196
    new-instance v2, Lcom/boyaa/widget/LoadingDialog;

    iget-object v3, p0, Lcom/boyaa/app/AppStartDialog;->activity:Landroid/app/Activity;

    invoke-direct {v2, v3}, Lcom/boyaa/widget/LoadingDialog;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/boyaa/app/AppStartDialog;->mLoadingDialog:Lcom/boyaa/widget/LoadingDialog;

    .line 197
    iget-object v2, p0, Lcom/boyaa/app/AppStartDialog;->mLoadingDialog:Lcom/boyaa/widget/LoadingDialog;

    invoke-virtual {v2}, Lcom/boyaa/widget/LoadingDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    .line 198
    .local v0, "dialogWindow":Landroid/view/Window;
    const/16 v2, 0x50

    invoke-virtual {v0, v2}, Landroid/view/Window;->setGravity(I)V

    .line 200
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 201
    .local v1, "lp":Landroid/view/WindowManager$LayoutParams;
    const/16 v2, 0xa

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 202
    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 204
    .end local v0    # "dialogWindow":Landroid/view/Window;
    .end local v1    # "lp":Landroid/view/WindowManager$LayoutParams;
    :cond_0
    iget-object v2, p0, Lcom/boyaa/app/AppStartDialog;->mLoadingDialog:Lcom/boyaa/widget/LoadingDialog;

    const-string v3, "\u6e38\u620f\u73a9\u547d\u52a0\u8f7d\u4e2d\uff0c\u8bf7\u7a0d\u7b49\u7247\u523b~"

    invoke-virtual {v2, v3}, Lcom/boyaa/widget/LoadingDialog;->showDialogForever(Ljava/lang/String;)V

    .line 205
    return-void
.end method

.method private showStartScreenImage(I)V
    .locals 3
    .param p1, "resPictureId"    # I

    .prologue
    .line 86
    iget-object v1, p0, Lcom/boyaa/app/AppStartDialog;->mImageViewPicture:Landroid/widget/ImageView;

    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setBackgroundResource(I)V

    .line 87
    iget-object v1, p0, Lcom/boyaa/app/AppStartDialog;->mImageViewPicture:Landroid/widget/ImageView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 88
    invoke-virtual {p0}, Lcom/boyaa/app/AppStartDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f040001

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 89
    .local v0, "startAnimation":Landroid/view/animation/Animation;
    new-instance v1, Lcom/boyaa/app/AppStartDialog$2;

    invoke-direct {v1, p0}, Lcom/boyaa/app/AppStartDialog$2;-><init>(Lcom/boyaa/app/AppStartDialog;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 105
    iget-object v1, p0, Lcom/boyaa/app/AppStartDialog;->mImageViewPicture:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 106
    return-void
.end method


# virtual methods
.method public dimissDialogImmediately()V
    .locals 0

    .prologue
    .line 173
    invoke-super {p0}, Landroid/app/AlertDialog;->dismiss()V

    .line 174
    return-void
.end method

.method public dismiss()V
    .locals 0

    .prologue
    .line 154
    invoke-super {p0}, Landroid/app/AlertDialog;->dismiss()V

    .line 155
    return-void
.end method

.method public dismissOnLuaLoaded()Z
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 161
    iput-boolean v1, p0, Lcom/boyaa/app/AppStartDialog;->isLuaLoaded:Z

    .line 162
    iget-boolean v0, p0, Lcom/boyaa/app/AppStartDialog;->isPlayingOver:Z

    if-eqz v0, :cond_0

    .line 163
    invoke-virtual {p0}, Lcom/boyaa/app/AppStartDialog;->dismiss()V

    .line 164
    iget-object v0, p0, Lcom/boyaa/app/AppStartDialog;->activity:Landroid/app/Activity;

    check-cast v0, Lcom/boyaa/enginedlqp/maindevelop/Game;

    invoke-virtual {v0}, Lcom/boyaa/enginedlqp/maindevelop/Game;->splashScreenFinish()V

    move v0, v1

    .line 167
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getResID(Ljava/lang/String;Ljava/lang/String;)I
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defType"    # Ljava/lang/String;

    .prologue
    .line 236
    iget-object v1, p0, Lcom/boyaa/app/AppStartDialog;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p0}, Lcom/boyaa/app/AppStartDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p1, p2, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 237
    .local v0, "resId":I
    return v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 44
    invoke-super {p0, p1}, Landroid/app/AlertDialog;->onCreate(Landroid/os/Bundle;)V

    .line 45
    iget-object v4, p0, Lcom/boyaa/app/AppStartDialog;->activity:Landroid/app/Activity;

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 46
    .local v0, "inflater":Landroid/view/LayoutInflater;
    const v4, 0x7f030009

    const/4 v5, 0x0

    invoke-virtual {v0, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 47
    .local v3, "view":Landroid/view/View;
    invoke-virtual {p0, v3}, Lcom/boyaa/app/AppStartDialog;->setContentView(Landroid/view/View;)V

    .line 49
    const v4, 0x7f060028

    invoke-virtual {p0, v4}, Lcom/boyaa/app/AppStartDialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    iput-object v4, p0, Lcom/boyaa/app/AppStartDialog;->mImageViewPicture:Landroid/widget/ImageView;

    .line 50
    const v4, 0x7f060027

    invoke-virtual {p0, v4}, Lcom/boyaa/app/AppStartDialog;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/boyaa/widget/CustomVideoView;

    iput-object v4, p0, Lcom/boyaa/app/AppStartDialog;->mVideoView:Lcom/boyaa/widget/CustomVideoView;

    .line 52
    const-string v4, "startvedio"

    const-string v5, "raw"

    invoke-virtual {p0, v4, v5}, Lcom/boyaa/app/AppStartDialog;->getResID(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 53
    .local v2, "resVideoId":I
    const-string v4, "start_screen_pricture"

    const-string v5, "drawable"

    invoke-virtual {p0, v4, v5}, Lcom/boyaa/app/AppStartDialog;->getResID(Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 54
    .local v1, "resPictureId":I
    if-lez v2, :cond_0

    .line 55
    invoke-direct {p0, v2}, Lcom/boyaa/app/AppStartDialog;->playVedio(I)V

    .line 59
    :goto_0
    return-void

    .line 57
    :cond_0
    invoke-direct {p0, v1}, Lcom/boyaa/app/AppStartDialog;->showStartScreenImage(I)V

    goto :goto_0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 228
    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 229
    const/4 v0, 0x1

    .line 232
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/app/AlertDialog;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public onStart()V
    .locals 0

    .prologue
    .line 148
    invoke-super {p0}, Landroid/app/AlertDialog;->onStart()V

    .line 150
    return-void
.end method

.method protected onStop()V
    .locals 0

    .prologue
    .line 222
    invoke-direct {p0}, Lcom/boyaa/app/AppStartDialog;->closeLoadingDialog()V

    .line 223
    invoke-super {p0}, Landroid/app/AlertDialog;->onStop()V

    .line 224
    return-void
.end method

.method public restartByParent()V
    .locals 1

    .prologue
    .line 189
    iget-object v0, p0, Lcom/boyaa/app/AppStartDialog;->mVideoView:Lcom/boyaa/widget/CustomVideoView;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/boyaa/app/AppStartDialog;->isVideo:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/boyaa/app/AppStartDialog;->isVideoPlaying:Z

    if-eqz v0, :cond_0

    .line 190
    iget-object v0, p0, Lcom/boyaa/app/AppStartDialog;->mVideoView:Lcom/boyaa/widget/CustomVideoView;

    invoke-virtual {v0}, Lcom/boyaa/widget/CustomVideoView;->start()V

    .line 192
    :cond_0
    return-void
.end method

.method public setLoadingListener(Lcom/boyaa/app/AppStartDialog$AppLoadingListener;)V
    .locals 0
    .param p1, "appLoadingListeners"    # Lcom/boyaa/app/AppStartDialog$AppLoadingListener;

    .prologue
    .line 242
    iput-object p1, p0, Lcom/boyaa/app/AppStartDialog;->listener:Lcom/boyaa/app/AppStartDialog$AppLoadingListener;

    .line 243
    return-void
.end method

.method public stopByParent()V
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lcom/boyaa/app/AppStartDialog;->mVideoView:Lcom/boyaa/widget/CustomVideoView;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/boyaa/app/AppStartDialog;->isVideo:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/boyaa/app/AppStartDialog;->isVideoPlaying:Z

    if-eqz v0, :cond_0

    .line 181
    iget-object v0, p0, Lcom/boyaa/app/AppStartDialog;->mVideoView:Lcom/boyaa/widget/CustomVideoView;

    invoke-virtual {v0}, Lcom/boyaa/widget/CustomVideoView;->pause()V

    .line 183
    :cond_0
    return-void
.end method
