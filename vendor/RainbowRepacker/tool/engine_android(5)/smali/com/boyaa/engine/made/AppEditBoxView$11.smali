.class Lcom/boyaa/engine/made/AppEditBoxView$11;
.super Landroid/text/method/NumberKeyListener;
.source "AppEditBoxView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/made/AppEditBoxView;->setExtraKeyListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final chars:[C

.field final synthetic this$0:Lcom/boyaa/engine/made/AppEditBoxView;


# direct methods
.method constructor <init>(Lcom/boyaa/engine/made/AppEditBoxView;)V
    .locals 1

    .prologue
    .line 559
    iput-object p1, p0, Lcom/boyaa/engine/made/AppEditBoxView$11;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    invoke-direct {p0}, Landroid/text/method/NumberKeyListener;-><init>()V

    .line 562
    const-string v0, "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView$11;->chars:[C

    return-void
.end method


# virtual methods
.method protected getAcceptedChars()[C
    .locals 1

    .prologue
    .line 573
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView$11;->chars:[C

    return-object v0
.end method

.method public getInputType()I
    .locals 2

    .prologue
    .line 567
    iget-object v0, p0, Lcom/boyaa/engine/made/AppEditBoxView$11;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    # getter for: Lcom/boyaa/engine/made/AppEditBoxView;->mInputModeContraints:I
    invoke-static {v0}, Lcom/boyaa/engine/made/AppEditBoxView;->access$1000(Lcom/boyaa/engine/made/AppEditBoxView;)I

    move-result v0

    iget-object v1, p0, Lcom/boyaa/engine/made/AppEditBoxView$11;->this$0:Lcom/boyaa/engine/made/AppEditBoxView;

    # getter for: Lcom/boyaa/engine/made/AppEditBoxView;->mInputFlagConstraints:I
    invoke-static {v1}, Lcom/boyaa/engine/made/AppEditBoxView;->access$1100(Lcom/boyaa/engine/made/AppEditBoxView;)I

    move-result v1

    or-int/2addr v0, v1

    return v0
.end method
