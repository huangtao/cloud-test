.class public Lcom/boyaa/engine/device/WebViewImpl$LoadingView;
.super Ljava/lang/Object;
.source "WebViewImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/engine/device/WebViewImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "LoadingView"
.end annotation


# instance fields
.field private rootLayout:Landroid/widget/RelativeLayout;

.field final synthetic this$0:Lcom/boyaa/engine/device/WebViewImpl;


# direct methods
.method public constructor <init>(Lcom/boyaa/engine/device/WebViewImpl;)V
    .locals 1

    .prologue
    .line 289
    iput-object p1, p0, Lcom/boyaa/engine/device/WebViewImpl$LoadingView;->this$0:Lcom/boyaa/engine/device/WebViewImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 290
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$LoadingView;->rootLayout:Landroid/widget/RelativeLayout;

    return-void
.end method


# virtual methods
.method public create(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V
    .locals 14
    .param p1, "param"    # Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    .prologue
    const v13, 0x106000d

    const/4 v3, 0x1

    const/4 v12, -0x2

    const/high16 v4, 0x3f000000    # 0.5f

    .line 302
    iget-object v1, p0, Lcom/boyaa/engine/device/WebViewImpl$LoadingView;->rootLayout:Landroid/widget/RelativeLayout;

    if-nez v1, :cond_0

    iget-object v1, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->layout:Landroid/widget/FrameLayout;

    if-eqz v1, :cond_0

    .line 303
    new-instance v1, Landroid/widget/RelativeLayout;

    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/boyaa/engine/device/WebViewImpl$LoadingView;->rootLayout:Landroid/widget/RelativeLayout;

    .line 304
    iget-object v1, p0, Lcom/boyaa/engine/device/WebViewImpl$LoadingView;->rootLayout:Landroid/widget/RelativeLayout;

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    iget v5, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->width:I

    iget v6, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->height:I

    invoke-direct {v2, v5, v6}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 305
    iget-object v1, p0, Lcom/boyaa/engine/device/WebViewImpl$LoadingView;->rootLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v13}, Landroid/widget/RelativeLayout;->setBackgroundColor(I)V

    .line 306
    iget-object v1, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->layout:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/boyaa/engine/device/WebViewImpl$LoadingView;->rootLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 308
    new-instance v9, Landroid/widget/LinearLayout;

    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v9, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 309
    .local v9, "linear":Landroid/widget/LinearLayout;
    new-instance v10, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v10, v12, v12}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 310
    .local v10, "rlp":Landroid/widget/RelativeLayout$LayoutParams;
    const/16 v1, 0xd

    invoke-virtual {v10, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 311
    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 312
    const/4 v1, 0x0

    invoke-virtual {v9, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 313
    invoke-virtual {v9, v13}, Landroid/widget/LinearLayout;->setBackgroundColor(I)V

    .line 314
    const/16 v1, 0x11

    invoke-virtual {v9, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 315
    iget-object v1, p0, Lcom/boyaa/engine/device/WebViewImpl$LoadingView;->rootLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v9}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 317
    iget-object v1, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->loadingBarImageFile:Ljava/lang/String;

    invoke-static {v1}, Landroid/graphics/drawable/Drawable;->createFromPath(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    .line 318
    .local v8, "img":Landroid/graphics/drawable/Drawable;
    new-instance v7, Landroid/widget/ImageView;

    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v7, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 319
    .local v7, "image":Landroid/widget/ImageView;
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    iget v2, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->loadingBarImageH:I

    iget v5, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->loadingBarImageH:I

    invoke-direct {v1, v2, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 320
    invoke-virtual {v7, v8}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 322
    new-instance v0, Landroid/view/animation/RotateAnimation;

    const/4 v1, 0x0

    const/high16 v2, 0x43b40000    # 360.0f

    move v5, v3

    move v6, v4

    invoke-direct/range {v0 .. v6}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    .line 323
    .local v0, "anim":Landroid/view/animation/RotateAnimation;
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/RotateAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 324
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/RotateAnimation;->setRepeatCount(I)V

    .line 325
    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/RotateAnimation;->setDuration(J)V

    .line 326
    invoke-virtual {v7, v0}, Landroid/widget/ImageView;->setAnimation(Landroid/view/animation/Animation;)V

    .line 327
    invoke-virtual {v7, v0}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 328
    invoke-virtual {v9, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 330
    iget-object v1, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->loadingBarText:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->loadingBarText:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 331
    new-instance v11, Landroid/widget/TextView;

    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v11, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 332
    .local v11, "text":Landroid/widget/TextView;
    iget-object v1, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->loadingBarText:Ljava/lang/String;

    invoke-virtual {v11, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 333
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x1010041

    invoke-virtual {v11, v1, v2}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 334
    invoke-virtual {v9, v11}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 337
    .end local v0    # "anim":Landroid/view/animation/RotateAnimation;
    .end local v7    # "image":Landroid/widget/ImageView;
    .end local v8    # "img":Landroid/graphics/drawable/Drawable;
    .end local v9    # "linear":Landroid/widget/LinearLayout;
    .end local v10    # "rlp":Landroid/widget/RelativeLayout$LayoutParams;
    .end local v11    # "text":Landroid/widget/TextView;
    :cond_0
    return-void
.end method

.method public destroy(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V
    .locals 2
    .param p1, "param"    # Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    .prologue
    .line 293
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$LoadingView;->rootLayout:Landroid/widget/RelativeLayout;

    if-eqz v0, :cond_1

    .line 294
    iget-object v0, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->layout:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_0

    .line 295
    iget-object v0, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->layout:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/boyaa/engine/device/WebViewImpl$LoadingView;->rootLayout:Landroid/widget/RelativeLayout;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 297
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$LoadingView;->rootLayout:Landroid/widget/RelativeLayout;

    .line 299
    :cond_1
    return-void
.end method

.method public reset(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V
    .locals 1
    .param p1, "param"    # Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    .prologue
    .line 340
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$LoadingView;->rootLayout:Landroid/widget/RelativeLayout;

    if-eqz v0, :cond_0

    .line 341
    invoke-virtual {p0, p1}, Lcom/boyaa/engine/device/WebViewImpl$LoadingView;->destroy(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V

    .line 342
    invoke-virtual {p0, p1}, Lcom/boyaa/engine/device/WebViewImpl$LoadingView;->create(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V

    .line 344
    :cond_0
    return-void
.end method
