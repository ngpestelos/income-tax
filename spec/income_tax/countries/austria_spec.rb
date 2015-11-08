describe IncomeTax::Countries::Austria do
  subject(:result) { described_class.new(income: income, income_type: type, tax_year: tax_year) }
  let(:type) { :gross }

  describe "from gross income of 0" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 1000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 10000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(37, 230)            }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == "8391.4".to_d                }
    its(:taxes)        { should be == "1608.6".to_d                }
  end

  describe "from gross income of 100000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(124, 297)           }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "58249.7".to_d               }
    its(:taxes)        { should be == "41750.3".to_d               }
  end

  describe "from gross income of 100000000" do
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(2703, 5407)         }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "50008249.7".to_d            }
    its(:taxes)        { should be == "49991750.3".to_d            }
  end

  describe "from net income of 0" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 1000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(38, 201)            }
    its(:gross_income) { should be == "12331.304347826087".to_d    }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "2331.304347826087".to_d     }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(167, 367)           }
    its(:gross_income) { should be == "183500.6".to_d              }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "83500.6".to_d               }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:tax_year)     { 2015                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(4878, 9757)         }
    its(:gross_income) { should be == "199983500.6".to_d           }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "99983500.6".to_d            }
  end
end
