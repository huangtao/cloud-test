.class public final Lcom/google/protobuf/UnknownFieldSetLite$Builder;
.super Ljava/lang/Object;
.source "UnknownFieldSetLite.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/UnknownFieldSetLite;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private set:Lcom/google/protobuf/UnknownFieldSetLite;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 385
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 386
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/protobuf/UnknownFieldSetLite$Builder;->set:Lcom/google/protobuf/UnknownFieldSetLite;

    .line 387
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/protobuf/UnknownFieldSetLite$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/google/protobuf/UnknownFieldSetLite$1;

    .prologue
    .line 381
    invoke-direct {p0}, Lcom/google/protobuf/UnknownFieldSetLite$Builder;-><init>()V

    return-void
.end method

.method private ensureNotBuilt()V
    .locals 2

    .prologue
    .line 393
    iget-object v0, p0, Lcom/google/protobuf/UnknownFieldSetLite$Builder;->set:Lcom/google/protobuf/UnknownFieldSetLite;

    if-nez v0, :cond_0

    .line 394
    new-instance v0, Lcom/google/protobuf/UnknownFieldSetLite;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/protobuf/UnknownFieldSetLite;-><init>(Lcom/google/protobuf/UnknownFieldSetLite$1;)V

    iput-object v0, p0, Lcom/google/protobuf/UnknownFieldSetLite$Builder;->set:Lcom/google/protobuf/UnknownFieldSetLite;

    .line 397
    :cond_0
    iget-object v0, p0, Lcom/google/protobuf/UnknownFieldSetLite$Builder;->set:Lcom/google/protobuf/UnknownFieldSetLite;

    invoke-virtual {v0}, Lcom/google/protobuf/UnknownFieldSetLite;->checkMutable()V

    .line 398
    return-void
.end method


# virtual methods
.method public build()Lcom/google/protobuf/UnknownFieldSetLite;
    .locals 1

    .prologue
    .line 448
    iget-object v0, p0, Lcom/google/protobuf/UnknownFieldSetLite$Builder;->set:Lcom/google/protobuf/UnknownFieldSetLite;

    if-nez v0, :cond_0

    .line 449
    # getter for: Lcom/google/protobuf/UnknownFieldSetLite;->DEFAULT_INSTANCE:Lcom/google/protobuf/UnknownFieldSetLite;
    invoke-static {}, Lcom/google/protobuf/UnknownFieldSetLite;->access$200()Lcom/google/protobuf/UnknownFieldSetLite;

    move-result-object v0

    .line 455
    :goto_0
    return-object v0

    .line 452
    :cond_0
    iget-object v0, p0, Lcom/google/protobuf/UnknownFieldSetLite$Builder;->set:Lcom/google/protobuf/UnknownFieldSetLite;

    invoke-virtual {v0}, Lcom/google/protobuf/UnknownFieldSetLite;->checkMutable()V

    .line 453
    iget-object v0, p0, Lcom/google/protobuf/UnknownFieldSetLite$Builder;->set:Lcom/google/protobuf/UnknownFieldSetLite;

    invoke-virtual {v0}, Lcom/google/protobuf/UnknownFieldSetLite;->makeImmutable()V

    .line 455
    iget-object v0, p0, Lcom/google/protobuf/UnknownFieldSetLite$Builder;->set:Lcom/google/protobuf/UnknownFieldSetLite;

    goto :goto_0
.end method

.method mergeFieldFrom(ILcom/google/protobuf/CodedInputStream;)Z
    .locals 1
    .param p1, "tag"    # I
    .param p2, "input"    # Lcom/google/protobuf/CodedInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 409
    invoke-direct {p0}, Lcom/google/protobuf/UnknownFieldSetLite$Builder;->ensureNotBuilt()V

    .line 410
    iget-object v0, p0, Lcom/google/protobuf/UnknownFieldSetLite$Builder;->set:Lcom/google/protobuf/UnknownFieldSetLite;

    invoke-virtual {v0, p1, p2}, Lcom/google/protobuf/UnknownFieldSetLite;->mergeFieldFrom(ILcom/google/protobuf/CodedInputStream;)Z

    move-result v0

    return v0
.end method

.method public mergeLengthDelimitedField(ILcom/google/protobuf/ByteString;)Lcom/google/protobuf/UnknownFieldSetLite$Builder;
    .locals 1
    .param p1, "fieldNumber"    # I
    .param p2, "value"    # Lcom/google/protobuf/ByteString;

    .prologue
    .line 432
    invoke-direct {p0}, Lcom/google/protobuf/UnknownFieldSetLite$Builder;->ensureNotBuilt()V

    .line 433
    iget-object v0, p0, Lcom/google/protobuf/UnknownFieldSetLite$Builder;->set:Lcom/google/protobuf/UnknownFieldSetLite;

    invoke-virtual {v0, p1, p2}, Lcom/google/protobuf/UnknownFieldSetLite;->mergeLengthDelimitedField(ILcom/google/protobuf/ByteString;)Lcom/google/protobuf/UnknownFieldSetLite;

    .line 434
    return-object p0
.end method

.method mergeVarintField(II)Lcom/google/protobuf/UnknownFieldSetLite$Builder;
    .locals 1
    .param p1, "fieldNumber"    # I
    .param p2, "value"    # I

    .prologue
    .line 421
    invoke-direct {p0}, Lcom/google/protobuf/UnknownFieldSetLite$Builder;->ensureNotBuilt()V

    .line 422
    iget-object v0, p0, Lcom/google/protobuf/UnknownFieldSetLite$Builder;->set:Lcom/google/protobuf/UnknownFieldSetLite;

    invoke-virtual {v0, p1, p2}, Lcom/google/protobuf/UnknownFieldSetLite;->mergeVarintField(II)Lcom/google/protobuf/UnknownFieldSetLite;

    .line 423
    return-object p0
.end method
