.class Lcom/boyaa/engine/device/WebViewImpl$ButtonView$1;
.super Ljava/lang/Object;
.source "WebViewImpl.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/device/WebViewImpl$ButtonView;->create(Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/boyaa/engine/device/WebViewImpl$ButtonView;

.field private final synthetic val$btnClose:Landroid/widget/ImageView;

.field private final synthetic val$param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;


# direct methods
.method constructor <init>(Lcom/boyaa/engine/device/WebViewImpl$ButtonView;Landroid/widget/ImageView;Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/engine/device/WebViewImpl$ButtonView$1;->this$1:Lcom/boyaa/engine/device/WebViewImpl$ButtonView;

    iput-object p2, p0, Lcom/boyaa/engine/device/WebViewImpl$ButtonView$1;->val$btnClose:Landroid/widget/ImageView;

    iput-object p3, p0, Lcom/boyaa/engine/device/WebViewImpl$ButtonView$1;->val$param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    .line 259
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "evt"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v1, 0x0

    .line 263
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 278
    :goto_0
    :pswitch_0
    const/4 v0, 0x1

    return v0

    .line 265
    :pswitch_1
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$ButtonView$1;->val$btnClose:Landroid/widget/ImageView;

    const v1, -0x777778

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->MULTIPLY:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v1, v2}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    goto :goto_0

    .line 269
    :pswitch_2
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$ButtonView$1;->val$btnClose:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    goto :goto_0

    .line 273
    :pswitch_3
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$ButtonView$1;->val$btnClose:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 274
    iget-object v0, p0, Lcom/boyaa/engine/device/WebViewImpl$ButtonView$1;->val$param:Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;

    iget v0, v0, Lcom/boyaa/engine/device/WebViewImpl$WebViewParam;->id:I

    const/4 v1, 0x2

    # invokes: Lcom/boyaa/engine/device/WebViewImpl;->onWebViewEvent(II)V
    invoke-static {v0, v1}, Lcom/boyaa/engine/device/WebViewImpl;->access$1(II)V

    goto :goto_0

    .line 263
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_3
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method
