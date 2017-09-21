.class public Lcom/boyaa/engine/device/WebViewImpl$ButtonView;
.super Ljava/lang/Object;
.source "WebViewImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/engine/device/WebViewImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ButtonView"
.end annotation


# instance fields
.field private rootLayout:Landroid/widget/FrameLayout;

.field final synthetic this$0:Lcom/boyaa/engine/device/WebViewImpl;


# direct methods
.method public constructor <init>(Lcom/boyaa/engine/device/WebViewImpl;)V
    .locals 1

    .prologue
    .line 228
    iput-object p1, p0, Lcom/boyaa/engine/device/WebViewImpl$ButtonView;->this$0:Lcom/boyaa/engine/device/WebViewImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 230
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$ButtonView;->rootLayout:Landroid/widget/FrameLayout;

    return-void
.end method


# virtual methods
.method public create(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V
    .locals 7
    .param p1, "param"    # Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    .prologue
    const/4 v6, 0x0

    .line 242
    iget v2, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->closeBtnPos:I

    if-lez v2, :cond_0

    .line 243
    iget-object v2, p0, Lcom/boyaa/engine/device/WebViewImpl$ButtonView;->rootLayout:Landroid/widget/FrameLayout;

    if-nez v2, :cond_0

    iget-object v2, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->layout:Landroid/widget/FrameLayout;

    if-eqz v2, :cond_0

    .line 244
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/boyaa/engine/device/WebViewImpl$ButtonView;->rootLayout:Landroid/widget/FrameLayout;

    .line 246
    new-instance v0, Landroid/widget/ImageView;

    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 247
    .local v0, "btnClose":Landroid/widget/ImageView;
    iget-object v2, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->closeBtnImageFile:Ljava/lang/String;

    invoke-static {v2}, Landroid/graphics/drawable/Drawable;->createFromPath(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 248
    .local v1, "imgClose":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 251
    const/4 v2, 0x1

    iget v3, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->closeBtnPos:I

    if-ne v2, v3, :cond_1

    .line 252
    iget-object v2, p0, Lcom/boyaa/engine/device/WebViewImpl$ButtonView;->rootLayout:Landroid/widget/FrameLayout;

    iget v3, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->width:I

    iget v4, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->closeBtnW:I

    sub-int/2addr v3, v4

    iget v4, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->height:I

    iget v5, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->closeBtnH:I

    sub-int/2addr v4, v5

    invoke-virtual {v2, v6, v6, v3, v4}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 259
    :goto_0
    new-instance v2, Lcom/boyaa/engine/device/WebViewImpl$ButtonView$1;

    invoke-direct {v2, p0, v0, p1}, Lcom/boyaa/engine/device/WebViewImpl$ButtonView$1;-><init>(Lcom/boyaa/engine/device/WebViewImpl$ButtonView;Landroid/widget/ImageView;Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 282
    iget-object v2, p0, Lcom/boyaa/engine/device/WebViewImpl$ButtonView;->rootLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 283
    iget-object v2, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->layout:Landroid/widget/FrameLayout;

    iget-object v3, p0, Lcom/boyaa/engine/device/WebViewImpl$ButtonView;->rootLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 286
    .end local v0    # "btnClose":Landroid/widget/ImageView;
    .end local v1    # "imgClose":Landroid/graphics/drawable/Drawable;
    :cond_0
    return-void

    .line 256
    .restart local v0    # "btnClose":Landroid/widget/ImageView;
    .restart local v1    # "imgClose":Landroid/graphics/drawable/Drawable;
    :cond_1
    iget-object v2, p0, Lcom/boyaa/engine/device/WebViewImpl$ButtonView;->rootLayout:Landroid/widget/FrameLayout;

    iget v3, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->width:I

    iget v4, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->closeBtnW:I

    sub-int/2addr v3, v4

    iget v4, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->height:I

    iget v5, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->closeBtnH:I

    sub-int/2addr v4, v5

    invoke-virtual {v2, v3, v6, v6, v4}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    goto :goto_0
.end method

.method public destroy(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V
    .locals 2
    .param p1, "param"    # Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    .prologue
    .line 233
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$ButtonView;->rootLayout:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_1

    .line 234
    iget-object v0, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->layout:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_0

    .line 235
    iget-object v0, p1, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->layout:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/boyaa/engine/device/WebViewImpl$ButtonView;->rootLayout:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 237
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$ButtonView;->rootLayout:Landroid/widget/FrameLayout;

    .line 239
    :cond_1
    return-void
.end method
